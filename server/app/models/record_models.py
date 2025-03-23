from app import db
from sqlalchemy import ForeignKeyConstraint


class Record(db.Model):
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, nullable=False)
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

    # 外部キー制約を明示的に定義（制約名をつける）
    __table_args__ = (
        ForeignKeyConstraint(
            ["user_id"], ["user.id"], ondelete="CASCADE", name="fk_record_user"
        ),
    )
