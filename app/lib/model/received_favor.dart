import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'received_favor.freezed.dart';
part 'received_favor.g.dart';

const _uuid = Uuid();

@freezed
class ReceivedFavor with _$ReceivedFavor {
  factory ReceivedFavor({
    required String id, // この御恩の個別id
    required String giverName, // 恩人の名前
    required String favorText, // 御恩のテキスト
    required DateTime favorDate, // 御恩を受けた日時
    @Default("") String memo, // メモ
  }) = _ReceivedFavor;

  factory ReceivedFavor.fromJson(Map<String, dynamic> json) =>
      _$ReceivedFavorFromJson(json);
}

// UUID を生成するメソッド
String generateUuid() => _uuid.v4();
