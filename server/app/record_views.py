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
