from app import db


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_name = db.Column(db.String(255), nullable=False)
    received_favor_count = db.Column(db.Integer, default=0, nullable=False)
    repaid_favor_count = db.Column(db.Integer, default=0, nullable=False)
    posts = db.relationship("Record", backref="user", cascade="all, delete")
