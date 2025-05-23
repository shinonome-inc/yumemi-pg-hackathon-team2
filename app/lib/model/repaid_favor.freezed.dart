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
  String get id => throw _privateConstructorUsedError; // この奉公の個別id
  String get receivedFavorId => throw _privateConstructorUsedError; // 受けた恩のid
  String get favorText => throw _privateConstructorUsedError; // 奉公のテキスト
  DateTime get favorDate => throw _privateConstructorUsedError; // 奉公をした日時
  String get memo => throw _privateConstructorUsedError;

  /// Serializes this RepaidFavor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RepaidFavor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      String receivedFavorId,
      String favorText,
      DateTime favorDate,
      String memo});
}

/// @nodoc
class _$RepaidFavorCopyWithImpl<$Res, $Val extends RepaidFavor>
    implements $RepaidFavorCopyWith<$Res> {
  _$RepaidFavorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RepaidFavor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receivedFavorId = null,
    Object? favorText = null,
    Object? favorDate = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavorId: null == receivedFavorId
          ? _value.receivedFavorId
          : receivedFavorId // ignore: cast_nullable_to_non_nullable
              as String,
      favorText: null == favorText
          ? _value.favorText
          : favorText // ignore: cast_nullable_to_non_nullable
              as String,
      favorDate: null == favorDate
          ? _value.favorDate
          : favorDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
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
      String receivedFavorId,
      String favorText,
      DateTime favorDate,
      String memo});
}

/// @nodoc
class __$$RepaidFavorImplCopyWithImpl<$Res>
    extends _$RepaidFavorCopyWithImpl<$Res, _$RepaidFavorImpl>
    implements _$$RepaidFavorImplCopyWith<$Res> {
  __$$RepaidFavorImplCopyWithImpl(
      _$RepaidFavorImpl _value, $Res Function(_$RepaidFavorImpl) _then)
      : super(_value, _then);

  /// Create a copy of RepaidFavor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receivedFavorId = null,
    Object? favorText = null,
    Object? favorDate = null,
    Object? memo = null,
  }) {
    return _then(_$RepaidFavorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavorId: null == receivedFavorId
          ? _value.receivedFavorId
          : receivedFavorId // ignore: cast_nullable_to_non_nullable
              as String,
      favorText: null == favorText
          ? _value.favorText
          : favorText // ignore: cast_nullable_to_non_nullable
              as String,
      favorDate: null == favorDate
          ? _value.favorDate
          : favorDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepaidFavorImpl implements _RepaidFavor {
  _$RepaidFavorImpl(
      {required this.id,
      this.receivedFavorId = "",
      required this.favorText,
      required this.favorDate,
      this.memo = ""});

  factory _$RepaidFavorImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepaidFavorImplFromJson(json);

  @override
  final String id;
// この奉公の個別id
  @override
  @JsonKey()
  final String receivedFavorId;
// 受けた恩のid
  @override
  final String favorText;
// 奉公のテキスト
  @override
  final DateTime favorDate;
// 奉公をした日時
  @override
  @JsonKey()
  final String memo;

  @override
  String toString() {
    return 'RepaidFavor(id: $id, receivedFavorId: $receivedFavorId, favorText: $favorText, favorDate: $favorDate, memo: $memo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepaidFavorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receivedFavorId, receivedFavorId) ||
                other.receivedFavorId == receivedFavorId) &&
            (identical(other.favorText, favorText) ||
                other.favorText == favorText) &&
            (identical(other.favorDate, favorDate) ||
                other.favorDate == favorDate) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, receivedFavorId, favorText, favorDate, memo);

  /// Create a copy of RepaidFavor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final String id,
      final String receivedFavorId,
      required final String favorText,
      required final DateTime favorDate,
      final String memo}) = _$RepaidFavorImpl;

  factory _RepaidFavor.fromJson(Map<String, dynamic> json) =
      _$RepaidFavorImpl.fromJson;

  @override
  String get id; // この奉公の個別id
  @override
  String get receivedFavorId; // 受けた恩のid
  @override
  String get favorText; // 奉公のテキスト
  @override
  DateTime get favorDate; // 奉公をした日時
  @override
  String get memo;

  /// Create a copy of RepaidFavor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RepaidFavorImplCopyWith<_$RepaidFavorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
