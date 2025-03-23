# from app import app, db
from app import app, db
from app.models.user_models import User
from app.models.record_models import Record
from flask import request, jsonify
from sqlalchemy import func


@app.route("/")
def index():
    return "API Server is running"


@app.route("/user/create", methods=["POST"])
def create_user():
    data = request.get_json()

    if not data or "user_name" not in data:
        return jsonify({"error": "ユーザー名は必須です"}), 400

    new_user = User(
        user_name=data["user_name"], received_favor_count=0, repaid_favor_count=0
    )

    try:
        db.session.add(new_user)
        db.session.commit()
        return "", 204
    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 500


@app.route("/user/delete", methods=["DELETE"])
def delete_user():
    data = request.get_json()

    if not data or "user_id" not in data:
        return jsonify({"error": "ユーザーIDは必須です"}), 400

    user_id = data["user_id"]
    user = User.query.get(user_id)
    if not user:
        return jsonify({"error": "ユーザーが見つかりません"}), 404

    try:
        db.session.delete(user)
        db.session.commit()
        return "", 204
    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 500


@app.route("/user/ranking", methods=["GET"])
def get_unreturned_favor_ranking():
    try:
        users_data = []

        user_ids = db.session.query(Record.user_id).distinct().all()

        for (user_id,) in user_ids:
            received_count = (
                db.session.query(func.count(Record.id))
                .filter(Record.user_id == user_id)
                .scalar()
                or 0
            )

            unreturned_count = (
                db.session.query(func.count(Record.id))
                .filter(Record.user_id == user_id, Record.repaid_favor_text == None)
                .scalar()
                or 0
            )

            returned_count = received_count - unreturned_count

            unreturned_ratio = 0
            if received_count > 0:
                unreturned_ratio = (unreturned_count / received_count) * 100

            users_data.append(
                {
                    "user_id": user_id,
                    "received_favor_count": received_count,
                    "returned_favor_count": returned_count,
                    "unreturned_favor_count": unreturned_count,
                    "unreturned_ratio": round(unreturned_ratio, 2),
                }
            )

        ranked_users = sorted(
            users_data, key=lambda x: x["unreturned_ratio"], reverse=True
        )

        return jsonify(ranked_users)

    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/user/update", methods=["PUT"])
def update_user_counts():
    data = request.get_json()

    if not data or "user_id" not in data:
        return jsonify({"error": "ユーザーIDは必須です"}), 400

    user_id = data["user_id"]
    user = User.query.get(user_id)

    if not user:
        return jsonify({"error": "ユーザーが見つかりません"}), 404

    if "received_favor_count" in data:
        user.received_favor_count = data["received_favor_count"]

    if "repaid_favor_count" in data:
        user.repaid_favor_count = data["repaid_favor_count"]

    try:
        db.session.commit()
        return "", 204
    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 500


@app.route("/user/changename", methods=["PUT"])
def change_user_name():
    data = request.get_json()

    if not data or "user_id" not in data or "user_name" not in data:
        return jsonify({"error": "ユーザーIDとユーザー名は必須です"}), 400

    user_id = data["user_id"]
    new_user_name = data["user_name"]

    user = User.query.get(user_id)

    if not user:
        return jsonify({"error": "ユーザーが見つかりません"}), 404

    user.user_name = new_user_name

    try:
        db.session.commit()
        return "", 204
    except Exception as e:
        db.session.rollback()
        return jsonify({"error": str(e)}), 500


@app.route("/record/create", methods=["POST"])
def create_record():
    data = request.get_json()

    new_record = Record(
        user_id=data.get("userID"),
        received_favor_text=data.get("receivedFavorText"),
        received_favor_date=data.get("receivedFavorDate"),
        giver_name=data.get("giverName"),
        repaid_favor_text=data.get("repaidFavorText"),
        repaid_favor_date=data.get("repaidFavorDate"),
        memo=data.get("memo"),
    )

    db.session.add(new_record)
    db.session.commit()

    return jsonify({"record_id": new_record.id}), 201


@app.route("/record/delete", methods=["POST"])
def delete_record():
    data = request.get_json()
    record_id = data.get("recordID")

    record = Record.query.get(record_id)
    if not record:
        return jsonify({"error": "Record not found"}), 404

    db.session.delete(record)
    db.session.commit()

    return jsonify({"message": "Record deleted successfully"}), 200


@app.route("/records", methods=["GET"])
def get_records():
    cursor = request.args.get("cursor", type=int)
    limit = request.args.get("limit", 20, type=int)

    query = Record.query.order_by(Record.created_at.desc())
    if cursor:
        query = query.filter(Record.id < cursor)

    records = query.limit(limit).all()

    items = [
        {
            "userId": record.user_id,
            "userName": record.user.name,  # userテーブルにnameカラムがある前提
            "id": record.id,
            "receivedFavorText": record.received_favor_text,
            "receivedFavorDate": record.received_favor_date,
            "repaidFavorText": record.repaid_favor_text,
            "repaiedFavorDate": record.repaid_favor_date,
        }
        for record in records
    ]

    next_cursor = records[-1].id if records else None

    return jsonify({"items": items, "nextCursor": next_cursor})
