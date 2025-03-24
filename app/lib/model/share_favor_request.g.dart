// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_favor_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShareFavorRequestImpl _$$ShareFavorRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$ShareFavorRequestImpl(
      userId: (json['user_id'] as num).toInt(),
      receivedFavorText: json['received_favor_text'] as String,
      receivedFavorDate: DateTime.parse(json['received_favor_date'] as String),
      giverName: json['giver_name'] as String,
      repaidFavorText: json['repaid_favor_text'] as String,
      repaidFavorDate: DateTime.parse(json['repaid_favor_date'] as String),
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$$ShareFavorRequestImplToJson(
        _$ShareFavorRequestImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'received_favor_text': instance.receivedFavorText,
      'received_favor_date': instance.receivedFavorDate.toIso8601String(),
      'giver_name': instance.giverName,
      'repaid_favor_text': instance.repaidFavorText,
      'repaid_favor_date': instance.repaidFavorDate.toIso8601String(),
      'memo': instance.memo,
    };
