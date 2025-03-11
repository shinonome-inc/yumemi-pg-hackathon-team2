// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_favor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceivedFavorImpl _$$ReceivedFavorImplFromJson(Map<String, dynamic> json) =>
    _$ReceivedFavorImpl(
      id: json['id'] as String? ?? "",
      favorText: json['favorText'] as String,
      favorDate: DateTime.parse(json['favorDate'] as String),
      memo: json['memo'] as String? ?? "",
    );

Map<String, dynamic> _$$ReceivedFavorImplToJson(_$ReceivedFavorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'favorText': instance.favorText,
      'favorDate': instance.favorDate.toIso8601String(),
      'memo': instance.memo,
    };
