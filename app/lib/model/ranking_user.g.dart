// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RankingUserImpl _$$RankingUserImplFromJson(Map<String, dynamic> json) =>
    _$RankingUserImpl(
      username: json['username'] as String,
      unreturnedRatio: (json['unreturned_ratio'] as num).toDouble(),
    );

Map<String, dynamic> _$$RankingUserImplToJson(_$RankingUserImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'unreturned_ratio': instance.unreturnedRatio,
    };
