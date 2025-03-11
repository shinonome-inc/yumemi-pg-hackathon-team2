import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'received_favor.dart'; // ReceivedFavor をインポート

part 'repaid_favor.freezed.dart';
part 'repaid_favor.g.dart';

const _uuid = Uuid();

@freezed
class RepaidFavor with _$RepaidFavor {
  factory RepaidFavor({
    @Default("") String id, // 返した恩のUUID（postのID）
    required ReceivedFavor receivedFavor, // 受けた恩のデータ
    required String repaidText, // 奉公のテキスト
    required DateTime repaidDate, // 奉公の日時
  }) = _RepaidFavor;

  factory RepaidFavor.fromJson(Map<String, dynamic> json) =>
      _$RepaidFavorFromJson(json);
}

// UUID を生成するメソッド
String generateUuid() => _uuid.v4();
