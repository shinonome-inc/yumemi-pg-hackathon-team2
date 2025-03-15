# 開発環境セットアップ

## 1. FVMのインストールとFlutterバージョン設定
本プロジェクトでは[FVM (Flutter Version Management)](https://fvm.app/)を使用してFlutterのバージョンを管理しています。

### **FVMのインストール**
FVMのインストールは以下のリンクを参考にしてください。

- **Windows:** [Zennの記事](https://zenn.dev/welchi/articles/d8f120adeebc7a85ed17)
- **Mac:** [Zennの記事](https://zenn.dev/hainare/scraps/5ff6a02a103782)

### **プロジェクトのFlutterバージョンを適用**
以下のコマンドを実行し、バージョン3.29.1をインストールしてください。
`fvm install 3.29.1`

その後、FVM経由でFlutterを使用するために、以下のコマンドを実行してください。

`fvm use`

## 2. コード生成（build_runner）の実行

本プロジェクトでは、コードの自動生成を補助するパッケージを使用しています。
そのため、新しいコードを適用する際には、以下のコマンドを実行してください。

`fvm flutter pub run build_runner build --delete-conflicting-outputs`
もしくは
`fvm dart run build_runner build --delete-conflicting-outputs`

このコマンドを実行することで、
- `freezed` などのコード生成ライブラリ
- `json_serializable` などのモデル自動生成
が正しく機能します。

開発中は `watch` モードを使うと便利です
`dart run build_runner watch --delete-conflicting-outputs`

## 3. アプリの起動
fvm flutter run

端末はChrome等のブラウザを選択してください！

//workflow実行テスト用メモ