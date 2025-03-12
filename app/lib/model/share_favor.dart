import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'share_favor.freezed.dart';
part 'share_favor.g.dart';

const _uuid = Uuid();

@freezed
class ShareFavor with _$ShareFavor {
  factory ShareFavor({
    required String userId, // ユーザーID
    required String userName, // ユーザー名
    required String id, // この投稿の個別id
    required String receivedFavorText, // 御恩のテキスト
    required DateTime eceivedFavorDate, // 御恩の日時
    required String repaidFavorText, // 御恩のテキスト
    required DateTime repaiedFavorDate, // 御恩の日時
  }) = _ShareFavor;

  factory ShareFavor.fromJson(Map<String, dynamic> json) =>
      _$ShareFavorFromJson(json);
}

// UUID を生成するメソッド
String generateUuid() => _uuid.v4();
