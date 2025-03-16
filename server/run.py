"""
エントリーポイント
appインスタンスを呼び出し、Flaskサーバーを起動
"""

from app import app

if __name__ == "__main__":
    app.run(debug=True)
