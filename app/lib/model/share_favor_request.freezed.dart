// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_favor_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ShareFavorRequest _$ShareFavorRequestFromJson(Map<String, dynamic> json) {
  return _ShareFavorRequest.fromJson(json);
}

/// @nodoc
mixin _$ShareFavorRequest {
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_favor_text')
  String get receivedFavorText => throw _privateConstructorUsedError;
  @JsonKey(name: 'received_favor_date')
  DateTime get receivedFavorDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'giver_name')
  String get giverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'repaid_favor_text')
  String get repaidFavorText => throw _privateConstructorUsedError;
  @JsonKey(name: 'repaid_favor_date')
  DateTime get repaidFavorDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'memo')
  String? get memo => throw _privateConstructorUsedError;

  /// Serializes this ShareFavorRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ShareFavorRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ShareFavorRequestCopyWith<ShareFavorRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareFavorRequestCopyWith<$Res> {
  factory $ShareFavorRequestCopyWith(
          ShareFavorRequest value, $Res Function(ShareFavorRequest) then) =
      _$ShareFavorRequestCopyWithImpl<$Res, ShareFavorRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'received_favor_text') String receivedFavorText,
      @JsonKey(name: 'received_favor_date') DateTime receivedFavorDate,
      @JsonKey(name: 'giver_name') String giverName,
      @JsonKey(name: 'repaid_favor_text') String repaidFavorText,
      @JsonKey(name: 'repaid_favor_date') DateTime repaidFavorDate,
      @JsonKey(name: 'memo') String? memo});
}

/// @nodoc
class _$ShareFavorRequestCopyWithImpl<$Res, $Val extends ShareFavorRequest>
    implements $ShareFavorRequestCopyWith<$Res> {
  _$ShareFavorRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ShareFavorRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? receivedFavorText = null,
    Object? receivedFavorDate = null,
    Object? giverName = null,
    Object? repaidFavorText = null,
    Object? repaidFavorDate = null,
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      receivedFavorText: null == receivedFavorText
          ? _value.receivedFavorText
          : receivedFavorText // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavorDate: null == receivedFavorDate
          ? _value.receivedFavorDate
          : receivedFavorDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      giverName: null == giverName
          ? _value.giverName
          : giverName // ignore: cast_nullable_to_non_nullable
              as String,
      repaidFavorText: null == repaidFavorText
          ? _value.repaidFavorText
          : repaidFavorText // ignore: cast_nullable_to_non_nullable
              as String,
      repaidFavorDate: null == repaidFavorDate
          ? _value.repaidFavorDate
          : repaidFavorDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      memo: freezed == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShareFavorRequestImplCopyWith<$Res>
    implements $ShareFavorRequestCopyWith<$Res> {
  factory _$$ShareFavorRequestImplCopyWith(_$ShareFavorRequestImpl value,
          $Res Function(_$ShareFavorRequestImpl) then) =
      __$$ShareFavorRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'received_favor_text') String receivedFavorText,
      @JsonKey(name: 'received_favor_date') DateTime receivedFavorDate,
      @JsonKey(name: 'giver_name') String giverName,
      @JsonKey(name: 'repaid_favor_text') String repaidFavorText,
      @JsonKey(name: 'repaid_favor_date') DateTime repaidFavorDate,
      @JsonKey(name: 'memo') String? memo});
}

/// @nodoc
class __$$ShareFavorRequestImplCopyWithImpl<$Res>
    extends _$ShareFavorRequestCopyWithImpl<$Res, _$ShareFavorRequestImpl>
    implements _$$ShareFavorRequestImplCopyWith<$Res> {
  __$$ShareFavorRequestImplCopyWithImpl(_$ShareFavorRequestImpl _value,
      $Res Function(_$ShareFavorRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ShareFavorRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? receivedFavorText = null,
    Object? receivedFavorDate = null,
    Object? giverName = null,
    Object? repaidFavorText = null,
    Object? repaidFavorDate = null,
    Object? memo = freezed,
  }) {
    return _then(_$ShareFavorRequestImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      receivedFavorText: null == receivedFavorText
          ? _value.receivedFavorText
          : receivedFavorText // ignore: cast_nullable_to_non_nullable
              as String,
      receivedFavorDate: null == receivedFavorDate
          ? _value.receivedFavorDate
          : receivedFavorDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      giverName: null == giverName
          ? _value.giverName
          : giverName // ignore: cast_nullable_to_non_nullable
              as String,
      repaidFavorText: null == repaidFavorText
          ? _value.repaidFavorText
          : repaidFavorText // ignore: cast_nullable_to_non_nullable
              as String,
      repaidFavorDate: null == repaidFavorDate
          ? _value.repaidFavorDate
          : repaidFavorDate // ignore: cast_nullable_to_non_nullable
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
class _$ShareFavorRequestImpl implements _ShareFavorRequest {
  const _$ShareFavorRequestImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'received_favor_text') required this.receivedFavorText,
      @JsonKey(name: 'received_favor_date') required this.receivedFavorDate,
      @JsonKey(name: 'giver_name') required this.giverName,
      @JsonKey(name: 'repaid_favor_text') required this.repaidFavorText,
      @JsonKey(name: 'repaid_favor_date') required this.repaidFavorDate,
      @JsonKey(name: 'memo') this.memo});

  factory _$ShareFavorRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShareFavorRequestImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'received_favor_text')
  final String receivedFavorText;
  @override
  @JsonKey(name: 'received_favor_date')
  final DateTime receivedFavorDate;
  @override
  @JsonKey(name: 'giver_name')
  final String giverName;
  @override
  @JsonKey(name: 'repaid_favor_text')
  final String repaidFavorText;
  @override
  @JsonKey(name: 'repaid_favor_date')
  final DateTime repaidFavorDate;
  @override
  @JsonKey(name: 'memo')
  final String? memo;

  @override
  String toString() {
    return 'ShareFavorRequest(userId: $userId, receivedFavorText: $receivedFavorText, receivedFavorDate: $receivedFavorDate, giverName: $giverName, repaidFavorText: $repaidFavorText, repaidFavorDate: $repaidFavorDate, memo: $memo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareFavorRequestImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.receivedFavorText, receivedFavorText) ||
                other.receivedFavorText == receivedFavorText) &&
            (identical(other.receivedFavorDate, receivedFavorDate) ||
                other.receivedFavorDate == receivedFavorDate) &&
            (identical(other.giverName, giverName) ||
                other.giverName == giverName) &&
            (identical(other.repaidFavorText, repaidFavorText) ||
                other.repaidFavorText == repaidFavorText) &&
            (identical(other.repaidFavorDate, repaidFavorDate) ||
                other.repaidFavorDate == repaidFavorDate) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, receivedFavorText,
      receivedFavorDate, giverName, repaidFavorText, repaidFavorDate, memo);

  /// Create a copy of ShareFavorRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ShareFavorRequestImplCopyWith<_$ShareFavorRequestImpl> get copyWith =>
      __$$ShareFavorRequestImplCopyWithImpl<_$ShareFavorRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShareFavorRequestImplToJson(
      this,
    );
  }
}

abstract class _ShareFavorRequest implements ShareFavorRequest {
  const factory _ShareFavorRequest(
      {@JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'received_favor_text')
      required final String receivedFavorText,
      @JsonKey(name: 'received_favor_date')
      required final DateTime receivedFavorDate,
      @JsonKey(name: 'giver_name') required final String giverName,
      @JsonKey(name: 'repaid_favor_text') required final String repaidFavorText,
      @JsonKey(name: 'repaid_favor_date')
      required final DateTime repaidFavorDate,
      @JsonKey(name: 'memo') final String? memo}) = _$ShareFavorRequestImpl;

  factory _ShareFavorRequest.fromJson(Map<String, dynamic> json) =
      _$ShareFavorRequestImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'received_favor_text')
  String get receivedFavorText;
  @override
  @JsonKey(name: 'received_favor_date')
  DateTime get receivedFavorDate;
  @override
  @JsonKey(name: 'giver_name')
  String get giverName;
  @override
  @JsonKey(name: 'repaid_favor_text')
  String get repaidFavorText;
  @override
  @JsonKey(name: 'repaid_favor_date')
  DateTime get repaidFavorDate;
  @override
  @JsonKey(name: 'memo')
  String? get memo;

  /// Create a copy of ShareFavorRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ShareFavorRequestImplCopyWith<_$ShareFavorRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
