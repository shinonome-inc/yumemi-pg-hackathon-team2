// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repaid_favor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RepaidFavor _$RepaidFavorFromJson(Map<String, dynamic> json) {
  return _RepaidFavor.fromJson(json);
}

/// @nodoc
mixin _$RepaidFavor {
  String get id => throw _privateConstructorUsedError; // 返した恩のUUID（postのID）
  ReceivedFavor get receivedFavor =>
      throw _privateConstructorUsedError; // 受けた恩のデータ
  String get repaidText => throw _privateConstructorUsedError; // 奉公のテキスト
  DateTime get repaidDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepaidFavorCopyWith<RepaidFavor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepaidFavorCopyWith<$Res> {
  factory $RepaidFavorCopyWith(
          RepaidFavor value, $Res Function(RepaidFavor) then) =
      _$RepaidFavorCopyWithImpl<$Res, RepaidFavor>;
  @useResult
  $Res call(
      {String id,
      ReceivedFavor receivedFavor,
      String repaidText,
      DateTime repaidDate});

  $ReceivedFavorCopyWith<$Res> get receivedFavor;
}

/// @nodoc
class _$RepaidFavorCopyWithImpl<$Res, $Val extends RepaidFavor>
    implements $RepaidFavorCopyWith<$Res> {
  _$RepaidFavorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receivedFavor = null,
    Object? repaidText = null,
    Object? repaidDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavor: null == receivedFavor
          ? _value.receivedFavor
          : receivedFavor // ignore: cast_nullable_to_non_nullable
              as ReceivedFavor,
      repaidText: null == repaidText
          ? _value.repaidText
          : repaidText // ignore: cast_nullable_to_non_nullable
              as String,
      repaidDate: null == repaidDate
          ? _value.repaidDate
          : repaidDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceivedFavorCopyWith<$Res> get receivedFavor {
    return $ReceivedFavorCopyWith<$Res>(_value.receivedFavor, (value) {
      return _then(_value.copyWith(receivedFavor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RepaidFavorImplCopyWith<$Res>
    implements $RepaidFavorCopyWith<$Res> {
  factory _$$RepaidFavorImplCopyWith(
          _$RepaidFavorImpl value, $Res Function(_$RepaidFavorImpl) then) =
      __$$RepaidFavorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ReceivedFavor receivedFavor,
      String repaidText,
      DateTime repaidDate});

  @override
  $ReceivedFavorCopyWith<$Res> get receivedFavor;
}

/// @nodoc
class __$$RepaidFavorImplCopyWithImpl<$Res>
    extends _$RepaidFavorCopyWithImpl<$Res, _$RepaidFavorImpl>
    implements _$$RepaidFavorImplCopyWith<$Res> {
  __$$RepaidFavorImplCopyWithImpl(
      _$RepaidFavorImpl _value, $Res Function(_$RepaidFavorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receivedFavor = null,
    Object? repaidText = null,
    Object? repaidDate = null,
  }) {
    return _then(_$RepaidFavorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavor: null == receivedFavor
          ? _value.receivedFavor
          : receivedFavor // ignore: cast_nullable_to_non_nullable
              as ReceivedFavor,
      repaidText: null == repaidText
          ? _value.repaidText
          : repaidText // ignore: cast_nullable_to_non_nullable
              as String,
      repaidDate: null == repaidDate
          ? _value.repaidDate
          : repaidDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepaidFavorImpl implements _RepaidFavor {
  _$RepaidFavorImpl(
      {this.id = "",
      required this.receivedFavor,
      required this.repaidText,
      required this.repaidDate});

  factory _$RepaidFavorImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepaidFavorImplFromJson(json);

  @override
  @JsonKey()
  final String id;
// 返した恩のUUID（postのID）
  @override
  final ReceivedFavor receivedFavor;
// 受けた恩のデータ
  @override
  final String repaidText;
// 奉公のテキスト
  @override
  final DateTime repaidDate;

  @override
  String toString() {
    return 'RepaidFavor(id: $id, receivedFavor: $receivedFavor, repaidText: $repaidText, repaidDate: $repaidDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepaidFavorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receivedFavor, receivedFavor) ||
                other.receivedFavor == receivedFavor) &&
            (identical(other.repaidText, repaidText) ||
                other.repaidText == repaidText) &&
            (identical(other.repaidDate, repaidDate) ||
                other.repaidDate == repaidDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, receivedFavor, repaidText, repaidDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepaidFavorImplCopyWith<_$RepaidFavorImpl> get copyWith =>
      __$$RepaidFavorImplCopyWithImpl<_$RepaidFavorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepaidFavorImplToJson(
      this,
    );
  }
}

abstract class _RepaidFavor implements RepaidFavor {
  factory _RepaidFavor(
      {final String id,
      required final ReceivedFavor receivedFavor,
      required final String repaidText,
      required final DateTime repaidDate}) = _$RepaidFavorImpl;

  factory _RepaidFavor.fromJson(Map<String, dynamic> json) =
      _$RepaidFavorImpl.fromJson;

  @override
  String get id;
  @override // 返した恩のUUID（postのID）
  ReceivedFavor get receivedFavor;
  @override // 受けた恩のデータ
  String get repaidText;
  @override // 奉公のテキスト
  DateTime get repaidDate;
  @override
  @JsonKey(ignore: true)
  _$$RepaidFavorImplCopyWith<_$RepaidFavorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
