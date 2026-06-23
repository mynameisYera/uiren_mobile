// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RequestOtpRequest _$RequestOtpRequestFromJson(Map<String, dynamic> json) {
  return _RequestOtpRequest.fromJson(json);
}

/// @nodoc
mixin _$RequestOtpRequest {
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this RequestOtpRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestOtpRequestCopyWith<RequestOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpRequestCopyWith<$Res> {
  factory $RequestOtpRequestCopyWith(
    RequestOtpRequest value,
    $Res Function(RequestOtpRequest) then,
  ) = _$RequestOtpRequestCopyWithImpl<$Res, RequestOtpRequest>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class _$RequestOtpRequestCopyWithImpl<$Res, $Val extends RequestOtpRequest>
    implements $RequestOtpRequestCopyWith<$Res> {
  _$RequestOtpRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phone = null}) {
    return _then(
      _value.copyWith(
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RequestOtpRequestImplCopyWith<$Res>
    implements $RequestOtpRequestCopyWith<$Res> {
  factory _$$RequestOtpRequestImplCopyWith(
    _$RequestOtpRequestImpl value,
    $Res Function(_$RequestOtpRequestImpl) then,
  ) = __$$RequestOtpRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$RequestOtpRequestImplCopyWithImpl<$Res>
    extends _$RequestOtpRequestCopyWithImpl<$Res, _$RequestOtpRequestImpl>
    implements _$$RequestOtpRequestImplCopyWith<$Res> {
  __$$RequestOtpRequestImplCopyWithImpl(
    _$RequestOtpRequestImpl _value,
    $Res Function(_$RequestOtpRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RequestOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phone = null}) {
    return _then(
      _$RequestOtpRequestImpl(
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOtpRequestImpl implements _RequestOtpRequest {
  const _$RequestOtpRequestImpl({required this.phone});

  factory _$RequestOtpRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOtpRequestImplFromJson(json);

  @override
  final String phone;

  @override
  String toString() {
    return 'RequestOtpRequest(phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOtpRequestImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone);

  /// Create a copy of RequestOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOtpRequestImplCopyWith<_$RequestOtpRequestImpl> get copyWith =>
      __$$RequestOtpRequestImplCopyWithImpl<_$RequestOtpRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOtpRequestImplToJson(this);
  }
}

abstract class _RequestOtpRequest implements RequestOtpRequest {
  const factory _RequestOtpRequest({required final String phone}) =
      _$RequestOtpRequestImpl;

  factory _RequestOtpRequest.fromJson(Map<String, dynamic> json) =
      _$RequestOtpRequestImpl.fromJson;

  @override
  String get phone;

  /// Create a copy of RequestOtpRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOtpRequestImplCopyWith<_$RequestOtpRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
