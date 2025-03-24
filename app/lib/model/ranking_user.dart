import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_user.freezed.dart';
part 'ranking_user.g.dart';

@freezed
class RankingUser with _$RankingUser {
  const factory RankingUser({
    required String username,
    @JsonKey(name: 'unreturned_ratio') required double unreturnedRatio,
  }) = _RankingUser;

  factory RankingUser.fromJson(Map<String, dynamic> json) =>
      _$RankingUserFromJson(json);
}
