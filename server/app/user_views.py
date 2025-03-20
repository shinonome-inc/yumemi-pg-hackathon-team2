from app import app, db
from app.models.user_models import User
from flask import request, jsonify


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
