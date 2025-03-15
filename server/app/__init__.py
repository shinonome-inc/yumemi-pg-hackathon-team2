"""
Flaskアプリケーションを作成し、設定や拡張機能を初期化の役割、アプリケーションの構成や設定に関するものが中心
DB接続の初期化、ブループリントの登録、その他のFlask拡張のセットアップなど
"""

from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_cors import CORS

# import os

app = Flask(__name__)
CORS(app)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///app.db"
# app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
# app.config["SECRET_KEY"] = os.environ.get("SECRET_KEY")

# DB接続の初期化
db = SQLAlchemy(app)
migrate = Migrate(app, db)
