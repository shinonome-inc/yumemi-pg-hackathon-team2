// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'received_favor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceivedFavor _$ReceivedFavorFromJson(Map<String, dynamic> json) {
  return _ReceivedFavor.fromJson(json);
}

/// @nodoc
mixin _$ReceivedFavor {
  String get id => throw _privateConstructorUsedError; // UUID
  String get favorText => throw _privateConstructorUsedError; // 御恩のテキスト
  DateTime get favorDate => throw _privateConstructorUsedError; // 御恩の日時
  String get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceivedFavorCopyWith<ReceivedFavor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivedFavorCopyWith<$Res> {
  factory $ReceivedFavorCopyWith(
          ReceivedFavor value, $Res Function(ReceivedFavor) then) =
      _$ReceivedFavorCopyWithImpl<$Res, ReceivedFavor>;
  @useResult
  $Res call({String id, String favorText, DateTime favorDate, String memo});
}

/// @nodoc
class _$ReceivedFavorCopyWithImpl<$Res, $Val extends ReceivedFavor>
    implements $ReceivedFavorCopyWith<$Res> {
  _$ReceivedFavorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? favorText = null,
    Object? favorDate = null,
    Object? memo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ReceivedFavorImplCopyWith<$Res>
    implements $ReceivedFavorCopyWith<$Res> {
  factory _$$ReceivedFavorImplCopyWith(
          _$ReceivedFavorImpl value, $Res Function(_$ReceivedFavorImpl) then) =
      __$$ReceivedFavorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String favorText, DateTime favorDate, String memo});
}

/// @nodoc
class __$$ReceivedFavorImplCopyWithImpl<$Res>
    extends _$ReceivedFavorCopyWithImpl<$Res, _$ReceivedFavorImpl>
    implements _$$ReceivedFavorImplCopyWith<$Res> {
  __$$ReceivedFavorImplCopyWithImpl(
      _$ReceivedFavorImpl _value, $Res Function(_$ReceivedFavorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? favorText = null,
    Object? favorDate = null,
    Object? memo = null,
  }) {
    return _then(_$ReceivedFavorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$ReceivedFavorImpl implements _ReceivedFavor {
  _$ReceivedFavorImpl(
      {this.id = "",
      required this.favorText,
      required this.favorDate,
      this.memo = ""});

  factory _$ReceivedFavorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceivedFavorImplFromJson(json);

  @override
  @JsonKey()
  final String id;
// UUID
  @override
  final String favorText;
// 御恩のテキスト
  @override
  final DateTime favorDate;
// 御恩の日時
  @override
  @JsonKey()
  final String memo;

  @override
  String toString() {
    return 'ReceivedFavor(id: $id, favorText: $favorText, favorDate: $favorDate, memo: $memo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceivedFavorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.favorText, favorText) ||
                other.favorText == favorText) &&
            (identical(other.favorDate, favorDate) ||
                other.favorDate == favorDate) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, favorText, favorDate, memo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceivedFavorImplCopyWith<_$ReceivedFavorImpl> get copyWith =>
      __$$ReceivedFavorImplCopyWithImpl<_$ReceivedFavorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceivedFavorImplToJson(
      this,
    );
  }
}

abstract class _ReceivedFavor implements ReceivedFavor {
  factory _ReceivedFavor(
      {final String id,
      required final String favorText,
      required final DateTime favorDate,
      final String memo}) = _$ReceivedFavorImpl;

  factory _ReceivedFavor.fromJson(Map<String, dynamic> json) =
      _$ReceivedFavorImpl.fromJson;

  @override
  String get id;
  @override // UUID
  String get favorText;
  @override // 御恩のテキスト
  DateTime get favorDate;
  @override // 御恩の日時
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$ReceivedFavorImplCopyWith<_$ReceivedFavorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
