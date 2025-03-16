from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class User(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_name = db.Column(db.String(255), nullable=False)
    received_favor_count = db.Column(db.Integer, default=0, nullable=False)
    repaid_favor_count = db.Column(db.Integer, default=0, nullable=False)

    def __repr__(self):
        return f"<User {self.user_name}, Received: {self.received_favor_count}, Repaid: {self.repaid_favor_count}>"
