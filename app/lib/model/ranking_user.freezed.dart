// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RankingUser _$RankingUserFromJson(Map<String, dynamic> json) {
  return _RankingUser.fromJson(json);
}

/// @nodoc
mixin _$RankingUser {
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'unreturned_ratio')
  double get unreturnedRatio => throw _privateConstructorUsedError;

  /// Serializes this RankingUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RankingUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RankingUserCopyWith<RankingUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RankingUserCopyWith<$Res> {
  factory $RankingUserCopyWith(
          RankingUser value, $Res Function(RankingUser) then) =
      _$RankingUserCopyWithImpl<$Res, RankingUser>;
  @useResult
  $Res call(
      {String username,
      @JsonKey(name: 'unreturned_ratio') double unreturnedRatio});
}

/// @nodoc
class _$RankingUserCopyWithImpl<$Res, $Val extends RankingUser>
    implements $RankingUserCopyWith<$Res> {
  _$RankingUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RankingUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? unreturnedRatio = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      unreturnedRatio: null == unreturnedRatio
          ? _value.unreturnedRatio
          : unreturnedRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RankingUserImplCopyWith<$Res>
    implements $RankingUserCopyWith<$Res> {
  factory _$$RankingUserImplCopyWith(
          _$RankingUserImpl value, $Res Function(_$RankingUserImpl) then) =
      __$$RankingUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      @JsonKey(name: 'unreturned_ratio') double unreturnedRatio});
}

/// @nodoc
class __$$RankingUserImplCopyWithImpl<$Res>
    extends _$RankingUserCopyWithImpl<$Res, _$RankingUserImpl>
    implements _$$RankingUserImplCopyWith<$Res> {
  __$$RankingUserImplCopyWithImpl(
      _$RankingUserImpl _value, $Res Function(_$RankingUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of RankingUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? unreturnedRatio = null,
  }) {
    return _then(_$RankingUserImpl(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      unreturnedRatio: null == unreturnedRatio
          ? _value.unreturnedRatio
          : unreturnedRatio // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RankingUserImpl implements _RankingUser {
  const _$RankingUserImpl(
      {required this.username,
      @JsonKey(name: 'unreturned_ratio') required this.unreturnedRatio});

  factory _$RankingUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$RankingUserImplFromJson(json);

  @override
  final String username;
  @override
  @JsonKey(name: 'unreturned_ratio')
  final double unreturnedRatio;

  @override
  String toString() {
    return 'RankingUser(username: $username, unreturnedRatio: $unreturnedRatio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RankingUserImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.unreturnedRatio, unreturnedRatio) ||
                other.unreturnedRatio == unreturnedRatio));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, username, unreturnedRatio);

  /// Create a copy of RankingUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RankingUserImplCopyWith<_$RankingUserImpl> get copyWith =>
      __$$RankingUserImplCopyWithImpl<_$RankingUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RankingUserImplToJson(
      this,
    );
  }
}

abstract class _RankingUser implements RankingUser {
  const factory _RankingUser(
      {required final String username,
      @JsonKey(name: 'unreturned_ratio')
      required final double unreturnedRatio}) = _$RankingUserImpl;

  factory _RankingUser.fromJson(Map<String, dynamic> json) =
      _$RankingUserImpl.fromJson;

  @override
  String get username;
  @override
  @JsonKey(name: 'unreturned_ratio')
  double get unreturnedRatio;

  /// Create a copy of RankingUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RankingUserImplCopyWith<_$RankingUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
