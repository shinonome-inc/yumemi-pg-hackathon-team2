// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_favor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShareFavorImpl _$$ShareFavorImplFromJson(Map<String, dynamic> json) =>
    _$ShareFavorImpl(
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      id: (json['id'] as num).toInt(),
      receivedFavorText: json['receivedFavorText'] as String,
      receivedFavorDate: DateTime.parse(json['receivedFavorDate'] as String),
      repaidFavorText: json['repaidFavorText'] as String,
      repaiedFavorDate: DateTime.parse(json['repaiedFavorDate'] as String),
    );

Map<String, dynamic> _$$ShareFavorImplToJson(_$ShareFavorImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'id': instance.id,
      'receivedFavorText': instance.receivedFavorText,
      'receivedFavorDate': instance.receivedFavorDate.toIso8601String(),
      'repaidFavorText': instance.repaidFavorText,
      'repaiedFavorDate': instance.repaiedFavorDate.toIso8601String(),
    };
