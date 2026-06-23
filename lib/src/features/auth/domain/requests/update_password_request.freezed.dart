// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_password_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UpdatePasswordRequest _$UpdatePasswordRequestFromJson(
  Map<String, dynamic> json,
) {
  return _UpdatePasswordRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdatePasswordRequest {
  @JsonKey(name: 'otp_session')
  String get otpSession => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;

  /// Serializes this UpdatePasswordRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdatePasswordRequestCopyWith<UpdatePasswordRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePasswordRequestCopyWith<$Res> {
  factory $UpdatePasswordRequestCopyWith(
    UpdatePasswordRequest value,
    $Res Function(UpdatePasswordRequest) then,
  ) = _$UpdatePasswordRequestCopyWithImpl<$Res, UpdatePasswordRequest>;
  @useResult
  $Res call({
    @JsonKey(name: 'otp_session') String otpSession,
    @JsonKey(name: 'password') String password,
  });
}

/// @nodoc
class _$UpdatePasswordRequestCopyWithImpl<
  $Res,
  $Val extends UpdatePasswordRequest
>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  _$UpdatePasswordRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? otpSession = null, Object? password = null}) {
    return _then(
      _value.copyWith(
            otpSession: null == otpSession
                ? _value.otpSession
                : otpSession // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UpdatePasswordRequestImplCopyWith<$Res>
    implements $UpdatePasswordRequestCopyWith<$Res> {
  factory _$$UpdatePasswordRequestImplCopyWith(
    _$UpdatePasswordRequestImpl value,
    $Res Function(_$UpdatePasswordRequestImpl) then,
  ) = __$$UpdatePasswordRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'otp_session') String otpSession,
    @JsonKey(name: 'password') String password,
  });
}

/// @nodoc
class __$$UpdatePasswordRequestImplCopyWithImpl<$Res>
    extends
        _$UpdatePasswordRequestCopyWithImpl<$Res, _$UpdatePasswordRequestImpl>
    implements _$$UpdatePasswordRequestImplCopyWith<$Res> {
  __$$UpdatePasswordRequestImplCopyWithImpl(
    _$UpdatePasswordRequestImpl _value,
    $Res Function(_$UpdatePasswordRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? otpSession = null, Object? password = null}) {
    return _then(
      _$UpdatePasswordRequestImpl(
        otpSession: null == otpSession
            ? _value.otpSession
            : otpSession // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdatePasswordRequestImpl implements _UpdatePasswordRequest {
  const _$UpdatePasswordRequestImpl({
    @JsonKey(name: 'otp_session') required this.otpSession,
    @JsonKey(name: 'password') required this.password,
  });

  factory _$UpdatePasswordRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdatePasswordRequestImplFromJson(json);

  @override
  @JsonKey(name: 'otp_session')
  final String otpSession;
  @override
  @JsonKey(name: 'password')
  final String password;

  @override
  String toString() {
    return 'UpdatePasswordRequest(otpSession: $otpSession, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePasswordRequestImpl &&
            (identical(other.otpSession, otpSession) ||
                other.otpSession == otpSession) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, otpSession, password);

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePasswordRequestImplCopyWith<_$UpdatePasswordRequestImpl>
  get copyWith =>
      __$$UpdatePasswordRequestImplCopyWithImpl<_$UpdatePasswordRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdatePasswordRequestImplToJson(this);
  }
}

abstract class _UpdatePasswordRequest implements UpdatePasswordRequest {
  const factory _UpdatePasswordRequest({
    @JsonKey(name: 'otp_session') required final String otpSession,
    @JsonKey(name: 'password') required final String password,
  }) = _$UpdatePasswordRequestImpl;

  factory _UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =
      _$UpdatePasswordRequestImpl.fromJson;

  @override
  @JsonKey(name: 'otp_session')
  String get otpSession;
  @override
  @JsonKey(name: 'password')
  String get password;

  /// Create a copy of UpdatePasswordRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePasswordRequestImplCopyWith<_$UpdatePasswordRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
