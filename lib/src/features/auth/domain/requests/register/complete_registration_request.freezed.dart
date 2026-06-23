// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'complete_registration_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CompleteRegistrationRequest _$CompleteRegistrationRequestFromJson(
  Map<String, dynamic> json,
) {
  return _CompleteRegistrationRequest.fromJson(json);
}

/// @nodoc
mixin _$CompleteRegistrationRequest {
  String get phone => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get group => throw _privateConstructorUsedError;

  /// Serializes this CompleteRegistrationRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CompleteRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompleteRegistrationRequestCopyWith<CompleteRegistrationRequest>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompleteRegistrationRequestCopyWith<$Res> {
  factory $CompleteRegistrationRequestCopyWith(
    CompleteRegistrationRequest value,
    $Res Function(CompleteRegistrationRequest) then,
  ) =
      _$CompleteRegistrationRequestCopyWithImpl<
        $Res,
        CompleteRegistrationRequest
      >;
  @useResult
  $Res call({
    String phone,
    String firstName,
    String lastName,
    String password,
    String group,
  });
}

/// @nodoc
class _$CompleteRegistrationRequestCopyWithImpl<
  $Res,
  $Val extends CompleteRegistrationRequest
>
    implements $CompleteRegistrationRequestCopyWith<$Res> {
  _$CompleteRegistrationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompleteRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? group = null,
  }) {
    return _then(
      _value.copyWith(
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            firstName: null == firstName
                ? _value.firstName
                : firstName // ignore: cast_nullable_to_non_nullable
                      as String,
            lastName: null == lastName
                ? _value.lastName
                : lastName // ignore: cast_nullable_to_non_nullable
                      as String,
            password: null == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String,
            group: null == group
                ? _value.group
                : group // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CompleteRegistrationRequestImplCopyWith<$Res>
    implements $CompleteRegistrationRequestCopyWith<$Res> {
  factory _$$CompleteRegistrationRequestImplCopyWith(
    _$CompleteRegistrationRequestImpl value,
    $Res Function(_$CompleteRegistrationRequestImpl) then,
  ) = __$$CompleteRegistrationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String phone,
    String firstName,
    String lastName,
    String password,
    String group,
  });
}

/// @nodoc
class __$$CompleteRegistrationRequestImplCopyWithImpl<$Res>
    extends
        _$CompleteRegistrationRequestCopyWithImpl<
          $Res,
          _$CompleteRegistrationRequestImpl
        >
    implements _$$CompleteRegistrationRequestImplCopyWith<$Res> {
  __$$CompleteRegistrationRequestImplCopyWithImpl(
    _$CompleteRegistrationRequestImpl _value,
    $Res Function(_$CompleteRegistrationRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompleteRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? group = null,
  }) {
    return _then(
      _$CompleteRegistrationRequestImpl(
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        firstName: null == firstName
            ? _value.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _value.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
        group: null == group
            ? _value.group
            : group // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CompleteRegistrationRequestImpl
    implements _CompleteRegistrationRequest {
  const _$CompleteRegistrationRequestImpl({
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.group = '',
  });

  factory _$CompleteRegistrationRequestImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$CompleteRegistrationRequestImplFromJson(json);

  @override
  final String phone;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String password;
  @override
  @JsonKey()
  final String group;

  @override
  String toString() {
    return 'CompleteRegistrationRequest(phone: $phone, firstName: $firstName, lastName: $lastName, password: $password, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteRegistrationRequestImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.group, group) || other.group == group));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, phone, firstName, lastName, password, group);

  /// Create a copy of CompleteRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteRegistrationRequestImplCopyWith<_$CompleteRegistrationRequestImpl>
  get copyWith =>
      __$$CompleteRegistrationRequestImplCopyWithImpl<
        _$CompleteRegistrationRequestImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompleteRegistrationRequestImplToJson(this);
  }
}

abstract class _CompleteRegistrationRequest
    implements CompleteRegistrationRequest {
  const factory _CompleteRegistrationRequest({
    required final String phone,
    required final String firstName,
    required final String lastName,
    required final String password,
    final String group,
  }) = _$CompleteRegistrationRequestImpl;

  factory _CompleteRegistrationRequest.fromJson(Map<String, dynamic> json) =
      _$CompleteRegistrationRequestImpl.fromJson;

  @override
  String get phone;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get password;
  @override
  String get group;

  /// Create a copy of CompleteRegistrationRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteRegistrationRequestImplCopyWith<_$CompleteRegistrationRequestImpl>
  get copyWith => throw _privateConstructorUsedError;
}
