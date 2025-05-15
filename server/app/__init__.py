"""
Flaskアプリケーションを作成し、設定や拡張機能を初期化の役割、アプリケーションの構成や設定に関するものが中心
DB接続の初期化、ブループリントの登録、その他のFlask拡張のセットアップなど
"""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_cors import CORS

from flask_admin import Admin
from flask_admin.contrib.sqla import ModelView

# import os

app = Flask(__name__)
CORS(app)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///app.db"
# app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
# app.config["SECRET_KEY"] = os.environ.get("SECRET_KEY")
app.config["SECRET_KEY"] = ""  # secretkeyを各自設定

# DB接続の初期化
db = SQLAlchemy(app)
migrate = Migrate(app, db)

# modelsディレクトリ内のモデルをインポート
from .models.user_models import User  # ユーザーモデル
from .models.record_models import Record  # 記録モデル

# viewをインポート
from .views import *


# Flask-Admin のセットアップ
admin = Admin(app, name="管理画面", template_mode="bootstrap3")

# モデルを Flask-Admin に登録
admin.add_view(ModelView(User, db.session))
admin.add_view(ModelView(Record, db.session))

# @app.route("/")
# def index():
#     return "API Server is running"
