"""Fix foreign key issue

Revision ID: 5b436b77c4d9
Revises: cf94a1eb1255
Create Date: 2025-03-24 00:33:04.268889

"""

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = "5b436b77c4d9"
down_revision = "cf94a1eb1255"
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table("record", schema=None) as batch_op:
        batch_op.drop_constraint("fk_record_user", type_="foreignkey")
        batch_op.create_foreign_key("fk_record_user", "user", ["user_id"], ["id"])

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table("record", schema=None) as batch_op:
        batch_op.drop_constraint(None, type_="foreignkey")
        batch_op.create_foreign_key(
            "fk_record_user", "user", ["user_id"], ["id"], ondelete="CASCADE"
        )

    # ### end Alembic commands ###
