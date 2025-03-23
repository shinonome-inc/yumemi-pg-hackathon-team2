from app import app, db
from app.models.record_models import Record
from flask import request, jsonify

# from sqlalchemy import func


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
