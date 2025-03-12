// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repaid_favor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepaidFavorImpl _$$RepaidFavorImplFromJson(Map<String, dynamic> json) =>
    _$RepaidFavorImpl(
      id: json['id'] as String? ?? "",
      receivedFavorId: json['receivedFavorId'] as String,
      favorText: json['favorText'] as String,
      favorDate: DateTime.parse(json['favorDate'] as String),
      memo: json['memo'] as String? ?? "",
    );

Map<String, dynamic> _$$RepaidFavorImplToJson(_$RepaidFavorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receivedFavorId': instance.receivedFavorId,
      'favorText': instance.favorText,
      'favorDate': instance.favorDate.toIso8601String(),
      'memo': instance.memo,
    };
