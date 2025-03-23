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
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError; // ユーザーID
  @JsonKey(name: 'user_name')
  String get userName => throw _privateConstructorUsedError; // ユーザー名
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError; // 投稿の個別ID
  @JsonKey(name: 'received_favor_text')
  String get receivedFavorText => throw _privateConstructorUsedError; // 御恩のテキスト
  @JsonKey(name: 'received_favor_date')
  DateTime get receivedFavorDate => throw _privateConstructorUsedError; // 御恩の日時
  @JsonKey(name: 'repaid_favor_text')
  String get repaidFavorText => throw _privateConstructorUsedError; // 恩返しのテキスト
  @JsonKey(name: 'repaid_favor_date')
  DateTime get repaiedFavorDate => throw _privateConstructorUsedError; // 恩返しの日時
  @JsonKey(name: 'memo')
  String? get memo => throw _privateConstructorUsedError;

  /// Serializes this ShareFavor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShareFavor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'received_favor_text') String receivedFavorText,
      @JsonKey(name: 'received_favor_date') DateTime receivedFavorDate,
      @JsonKey(name: 'repaid_favor_text') String repaidFavorText,
      @JsonKey(name: 'repaid_favor_date') DateTime repaiedFavorDate,
      @JsonKey(name: 'memo') String? memo});
}

/// @nodoc
class _$ShareFavorCopyWithImpl<$Res, $Val extends ShareFavor>
    implements $ShareFavorCopyWith<$Res> {
  _$ShareFavorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShareFavor
  /// with the given fields replaced by the non-null parameter values.
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
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'user_name') String userName,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'received_favor_text') String receivedFavorText,
      @JsonKey(name: 'received_favor_date') DateTime receivedFavorDate,
      @JsonKey(name: 'repaid_favor_text') String repaidFavorText,
      @JsonKey(name: 'repaid_favor_date') DateTime repaiedFavorDate,
      @JsonKey(name: 'memo') String? memo});
}

/// @nodoc
class __$$ShareFavorImplCopyWithImpl<$Res>
    extends _$ShareFavorCopyWithImpl<$Res, _$ShareFavorImpl>
    implements _$$ShareFavorImplCopyWith<$Res> {
  __$$ShareFavorImplCopyWithImpl(
      _$ShareFavorImpl _value, $Res Function(_$ShareFavorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShareFavor
  /// with the given fields replaced by the non-null parameter values.
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
    Object? memo = freezed,
  }) {
    return _then(_$ShareFavorImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShareFavorImpl implements _ShareFavor {
  _$ShareFavorImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'user_name') required this.userName,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'received_favor_text') required this.receivedFavorText,
      @JsonKey(name: 'received_favor_date') required this.receivedFavorDate,
      @JsonKey(name: 'repaid_favor_text') required this.repaidFavorText,
      @JsonKey(name: 'repaid_favor_date') required this.repaiedFavorDate,
      @JsonKey(name: 'memo') this.memo});

  factory _$ShareFavorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareFavorImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
// ユーザーID
  @override
  @JsonKey(name: 'user_name')
  final String userName;
// ユーザー名
  @override
  @JsonKey(name: 'id')
  final int id;
// 投稿の個別ID
  @override
  @JsonKey(name: 'received_favor_text')
  final String receivedFavorText;
// 御恩のテキスト
  @override
  @JsonKey(name: 'received_favor_date')
  final DateTime receivedFavorDate;
// 御恩の日時
  @override
  @JsonKey(name: 'repaid_favor_text')
  final String repaidFavorText;
// 恩返しのテキスト
  @override
  @JsonKey(name: 'repaid_favor_date')
  final DateTime repaiedFavorDate;
// 恩返しの日時
  @override
  @JsonKey(name: 'memo')
  final String? memo;

  @override
  String toString() {
    return 'ShareFavor(userId: $userId, userName: $userName, id: $id, receivedFavorText: $receivedFavorText, receivedFavorDate: $receivedFavorDate, repaidFavorText: $repaidFavorText, repaiedFavorDate: $repaiedFavorDate, memo: $memo)';
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
                other.repaiedFavorDate == repaiedFavorDate) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      userName,
      id,
      receivedFavorText,
      receivedFavorDate,
      repaidFavorText,
      repaiedFavorDate,
      memo);

  /// Create a copy of ShareFavor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {@JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'user_name') required final String userName,
      @JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'received_favor_text')
      required final String receivedFavorText,
      @JsonKey(name: 'received_favor_date')
      required final DateTime receivedFavorDate,
      @JsonKey(name: 'repaid_favor_text') required final String repaidFavorText,
      @JsonKey(name: 'repaid_favor_date')
      required final DateTime repaiedFavorDate,
      @JsonKey(name: 'memo') final String? memo}) = _$ShareFavorImpl;

  factory _ShareFavor.fromJson(Map<String, dynamic> json) =
      _$ShareFavorImpl.fromJson;


  /// Create a copy of ShareFavor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShareFavorImplCopyWith<_$ShareFavorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
