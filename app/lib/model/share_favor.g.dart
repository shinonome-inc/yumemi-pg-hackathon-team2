// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_favor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShareFavorImpl _$$ShareFavorImplFromJson(Map<String, dynamic> json) =>
    _$ShareFavorImpl(
      userId: (json['user_id'] as num).toInt(),
      userName: json['user_name'] as String,
      id: (json['id'] as num).toInt(),
      receivedFavorText: json['received_favor_text'] as String,
      receivedFavorDate: DateTime.parse(json['received_favor_date'] as String),
      repaidFavorText: json['repaid_favor_text'] as String,
      repaiedFavorDate: DateTime.parse(json['repaid_favor_date'] as String),
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$$ShareFavorImplToJson(_$ShareFavorImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'id': instance.id,
      'received_favor_text': instance.receivedFavorText,
      'received_favor_date': instance.receivedFavorDate.toIso8601String(),
      'repaid_favor_text': instance.repaidFavorText,
      'repaid_favor_date': instance.repaiedFavorDate.toIso8601String(),
      'memo': instance.memo,
    };
