// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_favor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShareFavor _$ShareFavorFromJson(Map<String, dynamic> json) {
  return _ShareFavor.fromJson(json);
}

/// @nodoc
mixin _$ShareFavor {
  String get userId => throw _privateConstructorUsedError; // ユーザーID
  String get userName => throw _privateConstructorUsedError; // ユーザー名
  String get id => throw _privateConstructorUsedError; // この投稿の個別id
  String get receivedFavorText => throw _privateConstructorUsedError; // 御恩のテキスト
  DateTime get receivedFavorDate => throw _privateConstructorUsedError; // 御恩の日時
  String get repaidFavorText => throw _privateConstructorUsedError; // 御恩のテキスト
  DateTime get repaiedFavorDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareFavorCopyWith<ShareFavor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareFavorCopyWith<$Res> {
  factory $ShareFavorCopyWith(
          ShareFavor value, $Res Function(ShareFavor) then) =
      _$ShareFavorCopyWithImpl<$Res, ShareFavor>;
  @useResult
  $Res call(
      {String userId,
      String userName,
      String id,
      String receivedFavorText,
      DateTime receivedFavorDate,
      String repaidFavorText,
      DateTime repaiedFavorDate});
}

/// @nodoc
class _$ShareFavorCopyWithImpl<$Res, $Val extends ShareFavor>
    implements $ShareFavorCopyWith<$Res> {
  _$ShareFavorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? id = null,
    Object? receivedFavorText = null,
    Object? receivedFavorDate = null,
    Object? repaidFavorText = null,
    Object? repaiedFavorDate = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavorText: null == receivedFavorText
          ? _value.receivedFavorText
          : receivedFavorText // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavorDate: null == receivedFavorDate
          ? _value.receivedFavorDate
          : receivedFavorDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      repaidFavorText: null == repaidFavorText
          ? _value.repaidFavorText
          : repaidFavorText // ignore: cast_nullable_to_non_nullable
              as String,
      repaiedFavorDate: null == repaiedFavorDate
          ? _value.repaiedFavorDate
          : repaiedFavorDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShareFavorImplCopyWith<$Res>
    implements $ShareFavorCopyWith<$Res> {
  factory _$$ShareFavorImplCopyWith(
          _$ShareFavorImpl value, $Res Function(_$ShareFavorImpl) then) =
      __$$ShareFavorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      String userName,
      String id,
      String receivedFavorText,
      DateTime receivedFavorDate,
      String repaidFavorText,
      DateTime repaiedFavorDate});
}

/// @nodoc
class __$$ShareFavorImplCopyWithImpl<$Res>
    extends _$ShareFavorCopyWithImpl<$Res, _$ShareFavorImpl>
    implements _$$ShareFavorImplCopyWith<$Res> {
  __$$ShareFavorImplCopyWithImpl(
      _$ShareFavorImpl _value, $Res Function(_$ShareFavorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = null,
    Object? id = null,
    Object? receivedFavorText = null,
    Object? receivedFavorDate = null,
    Object? repaidFavorText = null,
    Object? repaiedFavorDate = null,
  }) {
    return _then(_$ShareFavorImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavorText: null == receivedFavorText
          ? _value.receivedFavorText
          : receivedFavorText // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavorDate: null == receivedFavorDate
          ? _value.receivedFavorDate
          : receivedFavorDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      repaidFavorText: null == repaidFavorText
          ? _value.repaidFavorText
          : repaidFavorText // ignore: cast_nullable_to_non_nullable
              as String,
      repaiedFavorDate: null == repaiedFavorDate
          ? _value.repaiedFavorDate
          : repaiedFavorDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareFavorImpl implements _ShareFavor {
  _$ShareFavorImpl(
      {required this.userId,
      required this.userName,
      required this.id,
      required this.receivedFavorText,
      required this.receivedFavorDate,
      required this.repaidFavorText,
      required this.repaiedFavorDate});

  factory _$ShareFavorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareFavorImplFromJson(json);

  @override
  final String userId;
// ユーザーID
  @override
  final String userName;
// ユーザー名
  @override
  final String id;
// この投稿の個別id
  @override
  final String receivedFavorText;
// 御恩のテキスト
  @override
  final DateTime receivedFavorDate;
// 御恩の日時
  @override
  final String repaidFavorText;
// 御恩のテキスト
  @override
  final DateTime repaiedFavorDate;

  @override
  String toString() {
    return 'ShareFavor(userId: $userId, userName: $userName, id: $id, receivedFavorText: $receivedFavorText, receivedFavorDate: $receivedFavorDate, repaidFavorText: $repaidFavorText, repaiedFavorDate: $repaiedFavorDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareFavorImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receivedFavorText, receivedFavorText) ||
                other.receivedFavorText == receivedFavorText) &&
            (identical(other.receivedFavorDate, receivedFavorDate) ||
                other.receivedFavorDate == receivedFavorDate) &&
            (identical(other.repaidFavorText, repaidFavorText) ||
                other.repaidFavorText == repaidFavorText) &&
            (identical(other.repaiedFavorDate, repaiedFavorDate) ||
                other.repaiedFavorDate == repaiedFavorDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName, id,
      receivedFavorText, receivedFavorDate, repaidFavorText, repaiedFavorDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareFavorImplCopyWith<_$ShareFavorImpl> get copyWith =>
      __$$ShareFavorImplCopyWithImpl<_$ShareFavorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareFavorImplToJson(
      this,
    );
  }
}

abstract class _ShareFavor implements ShareFavor {
  factory _ShareFavor(
      {required final String userId,
      required final String userName,
      required final String id,
      required final String receivedFavorText,
      required final DateTime receivedFavorDate,
      required final String repaidFavorText,
      required final DateTime repaiedFavorDate}) = _$ShareFavorImpl;

  factory _ShareFavor.fromJson(Map<String, dynamic> json) =
      _$ShareFavorImpl.fromJson;

  @override
  String get userId;
  @override // ユーザーID
  String get userName;
  @override // ユーザー名
  String get id;
  @override // この投稿の個別id
  String get receivedFavorText;
  @override // 御恩のテキスト
  DateTime get receivedFavorDate;
  @override // 御恩の日時
  String get repaidFavorText;
  @override // 御恩のテキスト
  DateTime get repaiedFavorDate;
  @override
  @JsonKey(ignore: true)
  _$$ShareFavorImplCopyWith<_$ShareFavorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
