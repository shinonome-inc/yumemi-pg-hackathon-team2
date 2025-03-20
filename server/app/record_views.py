from app import app, db
from app.models.record_models import Record
from flask import jsonify
from sqlalchemy import func



@app.route("/user/ranking", methods=["GET"])
def get_unreturned_favor_ranking():
    try:
        users_data = []
    
        user_ids = db.session.query(Record.user_id).distinct().all()
        
        for (user_id,) in user_ids:
            received_count = db.session.query(func.count(Record.id)).filter(
                Record.user_id == user_id
            ).scalar() or 0
            
            unreturned_count = db.session.query(func.count(Record.id)).filter(
                Record.user_id == user_id,
                Record.repaid_favor_text == None
            ).scalar() or 0
            
            returned_count = received_count - unreturned_count
            
            unreturned_ratio = 0
            if received_count > 0:
                unreturned_ratio = (unreturned_count / received_count) * 100
            
            users_data.append({
                "user_id": user_id,
                "received_favor_count": received_count,
                "returned_favor_count": returned_count,
                "unreturned_favor_count": unreturned_count,
                "unreturned_ratio": round(unreturned_ratio, 2)
            })
        
        ranked_users = sorted(users_data, key=lambda x: x["unreturned_ratio"], reverse=True)
        
        return jsonify(ranked_users)
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500 