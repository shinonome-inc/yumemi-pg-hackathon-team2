## バックエンド

1. 仮想環境の構築（venvの場合）<br>

```bash:仮想環境
# 仮想環境の作成
python -m venv venv

# 仮想環境の起動
## windows_bashの場合
source venv/Scripts/activate

## windows_コマンドプロンプトの場合
venv/Scripts/activate

## macの場合
source venv/bin/activate
```

3. 必要なライブラリ・フレームワークのインストール（pipの場合）<br>

```bash:インストール
pip install -U -r requirements.txt
```

4. ローカルサーバーの起動
```bash:サーバー起動
python run.py
```
http://localhost:5000/ にアクセスすることができたら成功◎