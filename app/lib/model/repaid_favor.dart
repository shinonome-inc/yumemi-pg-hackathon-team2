import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'repaid_favor.freezed.dart';
part 'repaid_favor.g.dart';

const _uuid = Uuid();

@freezed
class RepaidFavor with _$RepaidFavor {
  factory RepaidFavor({
    @Default("") String id, // UUID
    required String receivedFavorId, // 受けた恩id
    required String favorText, // 御恩のテキスト
    required DateTime favorDate, // 御恩の日時
    @Default("") String memo, // メモ
  }) = _RepaidFavor;

  factory RepaidFavor.fromJson(Map<String, dynamic> json) =>
      _$RepaidFavorFromJson(json);
}

// UUID を生成するメソッド
String generateUuid() => _uuid.v4();
