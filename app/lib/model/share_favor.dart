import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'share_favor.freezed.dart';
part 'share_favor.g.dart';

const _uuid = Uuid();

@freezed
class ShareFavor with _$ShareFavor {
  factory ShareFavor({
    @JsonKey(name: 'user_id') required int userId, // ユーザーID
    @JsonKey(name: 'user_name') required String userName, // ユーザー名
    @JsonKey(name: 'id') required int id, // 投稿の個別ID
    @JsonKey(name: 'received_favor_text')
    required String receivedFavorText, // 御恩のテキスト
    @JsonKey(name: 'received_favor_date')
    required DateTime receivedFavorDate, // 御恩の日時
    @JsonKey(name: 'repaid_favor_text')
    required String repaidFavorText, // 恩返しのテキスト
    @JsonKey(name: 'repaid_favor_date')
    required DateTime repaiedFavorDate, // 恩返しの日時
    @JsonKey(name: 'memo') String? memo, // 任意メモ
  }) = _ShareFavor;

  factory ShareFavor.fromJson(Map<String, dynamic> json) =>
      _$ShareFavorFromJson(json);
}

// UUID を生成するメソッド
String generateUuid() => _uuid.v4();
