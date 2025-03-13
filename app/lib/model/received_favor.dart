import 'package:freezed_annotation/freezed_annotation.dart';

part 'received_favor.freezed.dart';
part 'received_favor.g.dart';

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
