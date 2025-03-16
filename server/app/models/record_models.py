from app import db


class Record(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"), nullable=False)
    received_favor_text = db.Column(db.String(255), nullable=True)
    received_favor_date = db.Column(db.DateTime, nullable=True)
    giver_name = db.Column(db.String(255), nullable=True)
    repaid_favor_text = db.Column(db.String(255), nullable=True)
    repaid_favor_date = db.Column(db.DateTime, nullable=True)
    memo = db.Column(db.String(255), nullable=True)
    created_at = db.Column(db.DateTime, server_default=db.func.now())
    updated_at = db.Column(
        db.DateTime, server_default=db.func.now(), onupdate=db.func.now()
    )
