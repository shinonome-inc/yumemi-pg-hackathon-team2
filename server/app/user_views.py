from app import app, db
from app.models.user_models import User
from app.models.record_models import Record
from flask import request, jsonify
from sqlalchemy import func


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


@app.route("/users/delete", methods=["DELETE"])
def delete_user(user_id):
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
