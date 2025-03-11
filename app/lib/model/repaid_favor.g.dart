// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repaid_favor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepaidFavorImpl _$$RepaidFavorImplFromJson(Map<String, dynamic> json) =>
    _$RepaidFavorImpl(
      id: json['id'] as String? ?? "",
      receivedFavor:
          ReceivedFavor.fromJson(json['receivedFavor'] as Map<String, dynamic>),
      repaidText: json['repaidText'] as String,
      repaidDate: DateTime.parse(json['repaidDate'] as String),
    );

Map<String, dynamic> _$$RepaidFavorImplToJson(_$RepaidFavorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receivedFavor': instance.receivedFavor,
      'repaidText': instance.repaidText,
      'repaidDate': instance.repaidDate.toIso8601String(),
    };
