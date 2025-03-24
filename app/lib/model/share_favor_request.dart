import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_favor_request.freezed.dart';
part 'share_favor_request.g.dart';

@freezed
class ShareFavorRequest with _$ShareFavorRequest {
  const factory ShareFavorRequest({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'received_favor_text') required String receivedFavorText,
    @JsonKey(name: 'received_favor_date') required DateTime receivedFavorDate,
    @JsonKey(name: 'giver_name') required String giverName,
    @JsonKey(name: 'repaid_favor_text') required String repaidFavorText,
    @JsonKey(name: 'repaid_favor_date') required DateTime repaidFavorDate,
    @JsonKey(name: 'memo') String? memo,
  }) = _ShareFavorRequest;

  factory ShareFavorRequest.fromJson(Map<String, dynamic> json) =>
      _$ShareFavorRequestFromJson(json);
}
