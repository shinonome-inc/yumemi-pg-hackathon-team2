import 'package:freezed_annotation/freezed_annotation.dart';

part 'repaid_favor.freezed.dart';
part 'repaid_favor.g.dart';

@freezed
class RepaidFavor with _$RepaidFavor {
  factory RepaidFavor({
    required String id, // この奉公の個別id
    @Default("") String receivedFavorId, // 受けた恩のid
    required String favorText, // 奉公のテキスト
    required DateTime favorDate, // 奉公をした日時
    @Default("") String memo, // メモ
  }) = _RepaidFavor;

  factory RepaidFavor.fromJson(Map<String, dynamic> json) =>
      _$RepaidFavorFromJson(json);
}
