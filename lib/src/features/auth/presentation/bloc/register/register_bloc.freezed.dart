// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) requestOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )
    completeRegistration,
    required TResult Function() resetToPhoneStep,
    required TResult Function() clearError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? requestOtp,
    TResult? Function(String otp)? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult? Function()? resetToPhoneStep,
    TResult? Function()? clearError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? requestOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult Function()? resetToPhoneStep,
    TResult Function()? clearError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestOtp value) requestOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CompleteRegistration value) completeRegistration,
    required TResult Function(_ResetToPhoneStep value) resetToPhoneStep,
    required TResult Function(_ClearError value) clearError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestOtp value)? requestOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CompleteRegistration value)? completeRegistration,
    TResult? Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult? Function(_ClearError value)? clearError,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestOtp value)? requestOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CompleteRegistration value)? completeRegistration,
    TResult Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
    RegisterEvent value,
    $Res Function(RegisterEvent) then,
  ) = _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RequestOtpImplCopyWith<$Res> {
  factory _$$RequestOtpImplCopyWith(
    _$RequestOtpImpl value,
    $Res Function(_$RequestOtpImpl) then,
  ) = __$$RequestOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phone});
}

/// @nodoc
class __$$RequestOtpImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$RequestOtpImpl>
    implements _$$RequestOtpImplCopyWith<$Res> {
  __$$RequestOtpImplCopyWithImpl(
    _$RequestOtpImpl _value,
    $Res Function(_$RequestOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? phone = null}) {
    return _then(
      _$RequestOtpImpl(
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RequestOtpImpl with DiagnosticableTreeMixin implements _RequestOtp {
  const _$RequestOtpImpl({required this.phone});

  @override
  final String phone;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegisterEvent.requestOtp(phone: $phone)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegisterEvent.requestOtp'))
      ..add(DiagnosticsProperty('phone', phone));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOtpImpl &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phone);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOtpImplCopyWith<_$RequestOtpImpl> get copyWith =>
      __$$RequestOtpImplCopyWithImpl<_$RequestOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) requestOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )
    completeRegistration,
    required TResult Function() resetToPhoneStep,
    required TResult Function() clearError,
  }) {
    return requestOtp(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? requestOtp,
    TResult? Function(String otp)? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult? Function()? resetToPhoneStep,
    TResult? Function()? clearError,
  }) {
    return requestOtp?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? requestOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult Function()? resetToPhoneStep,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (requestOtp != null) {
      return requestOtp(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestOtp value) requestOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CompleteRegistration value) completeRegistration,
    required TResult Function(_ResetToPhoneStep value) resetToPhoneStep,
    required TResult Function(_ClearError value) clearError,
  }) {
    return requestOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestOtp value)? requestOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CompleteRegistration value)? completeRegistration,
    TResult? Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return requestOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestOtp value)? requestOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CompleteRegistration value)? completeRegistration,
    TResult Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (requestOtp != null) {
      return requestOtp(this);
    }
    return orElse();
  }
}

abstract class _RequestOtp implements RegisterEvent {
  const factory _RequestOtp({required final String phone}) = _$RequestOtpImpl;

  String get phone;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestOtpImplCopyWith<_$RequestOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
    _$VerifyOtpImpl value,
    $Res Function(_$VerifyOtpImpl) then,
  ) = __$$VerifyOtpImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String otp});
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
    _$VerifyOtpImpl _value,
    $Res Function(_$VerifyOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? otp = null}) {
    return _then(
      _$VerifyOtpImpl(
        otp: null == otp
            ? _value.otp
            : otp // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$VerifyOtpImpl with DiagnosticableTreeMixin implements _VerifyOtp {
  const _$VerifyOtpImpl({required this.otp});

  @override
  final String otp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegisterEvent.verifyOtp(otp: $otp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegisterEvent.verifyOtp'))
      ..add(DiagnosticsProperty('otp', otp));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpImpl &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      __$$VerifyOtpImplCopyWithImpl<_$VerifyOtpImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) requestOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )
    completeRegistration,
    required TResult Function() resetToPhoneStep,
    required TResult Function() clearError,
  }) {
    return verifyOtp(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? requestOtp,
    TResult? Function(String otp)? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult? Function()? resetToPhoneStep,
    TResult? Function()? clearError,
  }) {
    return verifyOtp?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? requestOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult Function()? resetToPhoneStep,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestOtp value) requestOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CompleteRegistration value) completeRegistration,
    required TResult Function(_ResetToPhoneStep value) resetToPhoneStep,
    required TResult Function(_ClearError value) clearError,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestOtp value)? requestOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CompleteRegistration value)? completeRegistration,
    TResult? Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestOtp value)? requestOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CompleteRegistration value)? completeRegistration,
    TResult Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements RegisterEvent {
  const factory _VerifyOtp({required final String otp}) = _$VerifyOtpImpl;

  String get otp;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpImplCopyWith<_$VerifyOtpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResendOtpImplCopyWith<$Res> {
  factory _$$ResendOtpImplCopyWith(
    _$ResendOtpImpl value,
    $Res Function(_$ResendOtpImpl) then,
  ) = __$$ResendOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendOtpImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$ResendOtpImpl>
    implements _$$ResendOtpImplCopyWith<$Res> {
  __$$ResendOtpImplCopyWithImpl(
    _$ResendOtpImpl _value,
    $Res Function(_$ResendOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResendOtpImpl with DiagnosticableTreeMixin implements _ResendOtp {
  const _$ResendOtpImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegisterEvent.resendOtp()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'RegisterEvent.resendOtp'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResendOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) requestOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )
    completeRegistration,
    required TResult Function() resetToPhoneStep,
    required TResult Function() clearError,
  }) {
    return resendOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? requestOtp,
    TResult? Function(String otp)? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult? Function()? resetToPhoneStep,
    TResult? Function()? clearError,
  }) {
    return resendOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? requestOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult Function()? resetToPhoneStep,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestOtp value) requestOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CompleteRegistration value) completeRegistration,
    required TResult Function(_ResetToPhoneStep value) resetToPhoneStep,
    required TResult Function(_ClearError value) clearError,
  }) {
    return resendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestOtp value)? requestOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CompleteRegistration value)? completeRegistration,
    TResult? Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return resendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestOtp value)? requestOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CompleteRegistration value)? completeRegistration,
    TResult Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(this);
    }
    return orElse();
  }
}

abstract class _ResendOtp implements RegisterEvent {
  const factory _ResendOtp() = _$ResendOtpImpl;
}

/// @nodoc
abstract class _$$CompleteRegistrationImplCopyWith<$Res> {
  factory _$$CompleteRegistrationImplCopyWith(
    _$CompleteRegistrationImpl value,
    $Res Function(_$CompleteRegistrationImpl) then,
  ) = __$$CompleteRegistrationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String firstName,
    String lastName,
    String password,
    String group,
    VoidCallback onSuccess,
  });
}

/// @nodoc
class __$$CompleteRegistrationImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$CompleteRegistrationImpl>
    implements _$$CompleteRegistrationImplCopyWith<$Res> {
  __$$CompleteRegistrationImplCopyWithImpl(
    _$CompleteRegistrationImpl _value,
    $Res Function(_$CompleteRegistrationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? password = null,
    Object? group = null,
    Object? onSuccess = null,
  }) {
    return _then(
      _$CompleteRegistrationImpl(
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
        onSuccess: null == onSuccess
            ? _value.onSuccess
            : onSuccess // ignore: cast_nullable_to_non_nullable
                  as VoidCallback,
      ),
    );
  }
}

/// @nodoc

class _$CompleteRegistrationImpl
    with DiagnosticableTreeMixin
    implements _CompleteRegistration {
  const _$CompleteRegistrationImpl({
    required this.firstName,
    required this.lastName,
    required this.password,
    this.group = '',
    required this.onSuccess,
  });

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
  final VoidCallback onSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegisterEvent.completeRegistration(firstName: $firstName, lastName: $lastName, password: $password, group: $group, onSuccess: $onSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegisterEvent.completeRegistration'))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('group', group))
      ..add(DiagnosticsProperty('onSuccess', onSuccess));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompleteRegistrationImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.onSuccess, onSuccess) ||
                other.onSuccess == onSuccess));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, password, group, onSuccess);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompleteRegistrationImplCopyWith<_$CompleteRegistrationImpl>
  get copyWith =>
      __$$CompleteRegistrationImplCopyWithImpl<_$CompleteRegistrationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) requestOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )
    completeRegistration,
    required TResult Function() resetToPhoneStep,
    required TResult Function() clearError,
  }) {
    return completeRegistration(
      firstName,
      lastName,
      password,
      group,
      onSuccess,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? requestOtp,
    TResult? Function(String otp)? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult? Function()? resetToPhoneStep,
    TResult? Function()? clearError,
  }) {
    return completeRegistration?.call(
      firstName,
      lastName,
      password,
      group,
      onSuccess,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? requestOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult Function()? resetToPhoneStep,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (completeRegistration != null) {
      return completeRegistration(
        firstName,
        lastName,
        password,
        group,
        onSuccess,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestOtp value) requestOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CompleteRegistration value) completeRegistration,
    required TResult Function(_ResetToPhoneStep value) resetToPhoneStep,
    required TResult Function(_ClearError value) clearError,
  }) {
    return completeRegistration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestOtp value)? requestOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CompleteRegistration value)? completeRegistration,
    TResult? Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return completeRegistration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestOtp value)? requestOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CompleteRegistration value)? completeRegistration,
    TResult Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (completeRegistration != null) {
      return completeRegistration(this);
    }
    return orElse();
  }
}

abstract class _CompleteRegistration implements RegisterEvent {
  const factory _CompleteRegistration({
    required final String firstName,
    required final String lastName,
    required final String password,
    final String group,
    required final VoidCallback onSuccess,
  }) = _$CompleteRegistrationImpl;

  String get firstName;
  String get lastName;
  String get password;
  String get group;
  VoidCallback get onSuccess;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompleteRegistrationImplCopyWith<_$CompleteRegistrationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetToPhoneStepImplCopyWith<$Res> {
  factory _$$ResetToPhoneStepImplCopyWith(
    _$ResetToPhoneStepImpl value,
    $Res Function(_$ResetToPhoneStepImpl) then,
  ) = __$$ResetToPhoneStepImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetToPhoneStepImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$ResetToPhoneStepImpl>
    implements _$$ResetToPhoneStepImplCopyWith<$Res> {
  __$$ResetToPhoneStepImplCopyWithImpl(
    _$ResetToPhoneStepImpl _value,
    $Res Function(_$ResetToPhoneStepImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetToPhoneStepImpl
    with DiagnosticableTreeMixin
    implements _ResetToPhoneStep {
  const _$ResetToPhoneStepImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegisterEvent.resetToPhoneStep()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegisterEvent.resetToPhoneStep'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetToPhoneStepImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) requestOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )
    completeRegistration,
    required TResult Function() resetToPhoneStep,
    required TResult Function() clearError,
  }) {
    return resetToPhoneStep();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? requestOtp,
    TResult? Function(String otp)? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult? Function()? resetToPhoneStep,
    TResult? Function()? clearError,
  }) {
    return resetToPhoneStep?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? requestOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult Function()? resetToPhoneStep,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (resetToPhoneStep != null) {
      return resetToPhoneStep();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestOtp value) requestOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CompleteRegistration value) completeRegistration,
    required TResult Function(_ResetToPhoneStep value) resetToPhoneStep,
    required TResult Function(_ClearError value) clearError,
  }) {
    return resetToPhoneStep(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestOtp value)? requestOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CompleteRegistration value)? completeRegistration,
    TResult? Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return resetToPhoneStep?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestOtp value)? requestOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CompleteRegistration value)? completeRegistration,
    TResult Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (resetToPhoneStep != null) {
      return resetToPhoneStep(this);
    }
    return orElse();
  }
}

abstract class _ResetToPhoneStep implements RegisterEvent {
  const factory _ResetToPhoneStep() = _$ResetToPhoneStepImpl;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
    _$ClearErrorImpl value,
    $Res Function(_$ClearErrorImpl) then,
  ) = __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
    _$ClearErrorImpl _value,
    $Res Function(_$ClearErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearErrorImpl with DiagnosticableTreeMixin implements _ClearError {
  const _$ClearErrorImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegisterEvent.clearError()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'RegisterEvent.clearError'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String phone) requestOtp,
    required TResult Function(String otp) verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )
    completeRegistration,
    required TResult Function() resetToPhoneStep,
    required TResult Function() clearError,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String phone)? requestOtp,
    TResult? Function(String otp)? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult? Function()? resetToPhoneStep,
    TResult? Function()? clearError,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String phone)? requestOtp,
    TResult Function(String otp)? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function(
      String firstName,
      String lastName,
      String password,
      String group,
      VoidCallback onSuccess,
    )?
    completeRegistration,
    TResult Function()? resetToPhoneStep,
    TResult Function()? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestOtp value) requestOtp,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_CompleteRegistration value) completeRegistration,
    required TResult Function(_ResetToPhoneStep value) resetToPhoneStep,
    required TResult Function(_ClearError value) clearError,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestOtp value)? requestOtp,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_CompleteRegistration value)? completeRegistration,
    TResult? Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult? Function(_ClearError value)? clearError,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestOtp value)? requestOtp,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_CompleteRegistration value)? completeRegistration,
    TResult Function(_ResetToPhoneStep value)? resetToPhoneStep,
    TResult Function(_ClearError value)? clearError,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements RegisterEvent {
  const factory _ClearError() = _$ClearErrorImpl;
}

/// @nodoc
mixin _$RegisterState {
  RegisterStep get step => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  int get otpExpiresIn => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get errorCode => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
    RegisterState value,
    $Res Function(RegisterState) then,
  ) = _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call({
    RegisterStep step,
    String phone,
    int otpExpiresIn,
    bool isLoading,
    String? errorMessage,
    String? errorCode,
    bool isSuccess,
  });
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? phone = null,
    Object? otpExpiresIn = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? errorCode = freezed,
    Object? isSuccess = null,
  }) {
    return _then(
      _value.copyWith(
            step: null == step
                ? _value.step
                : step // ignore: cast_nullable_to_non_nullable
                      as RegisterStep,
            phone: null == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String,
            otpExpiresIn: null == otpExpiresIn
                ? _value.otpExpiresIn
                : otpExpiresIn // ignore: cast_nullable_to_non_nullable
                      as int,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorCode: freezed == errorCode
                ? _value.errorCode
                : errorCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSuccess: null == isSuccess
                ? _value.isSuccess
                : isSuccess // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RegisterStateImplCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$RegisterStateImplCopyWith(
    _$RegisterStateImpl value,
    $Res Function(_$RegisterStateImpl) then,
  ) = __$$RegisterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    RegisterStep step,
    String phone,
    int otpExpiresIn,
    bool isLoading,
    String? errorMessage,
    String? errorCode,
    bool isSuccess,
  });
}

/// @nodoc
class __$$RegisterStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterStateImpl>
    implements _$$RegisterStateImplCopyWith<$Res> {
  __$$RegisterStateImplCopyWithImpl(
    _$RegisterStateImpl _value,
    $Res Function(_$RegisterStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? phone = null,
    Object? otpExpiresIn = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? errorCode = freezed,
    Object? isSuccess = null,
  }) {
    return _then(
      _$RegisterStateImpl(
        step: null == step
            ? _value.step
            : step // ignore: cast_nullable_to_non_nullable
                  as RegisterStep,
        phone: null == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String,
        otpExpiresIn: null == otpExpiresIn
            ? _value.otpExpiresIn
            : otpExpiresIn // ignore: cast_nullable_to_non_nullable
                  as int,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorCode: freezed == errorCode
            ? _value.errorCode
            : errorCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSuccess: null == isSuccess
            ? _value.isSuccess
            : isSuccess // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$RegisterStateImpl
    with DiagnosticableTreeMixin
    implements _RegisterState {
  const _$RegisterStateImpl({
    this.step = RegisterStep.phone,
    this.phone = '',
    this.otpExpiresIn = 0,
    this.isLoading = false,
    this.errorMessage,
    this.errorCode,
    this.isSuccess = false,
  });

  @override
  @JsonKey()
  final RegisterStep step;
  @override
  @JsonKey()
  final String phone;
  @override
  @JsonKey()
  final int otpExpiresIn;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  final String? errorCode;
  @override
  @JsonKey()
  final bool isSuccess;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RegisterState(step: $step, phone: $phone, otpExpiresIn: $otpExpiresIn, isLoading: $isLoading, errorMessage: $errorMessage, errorCode: $errorCode, isSuccess: $isSuccess)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RegisterState'))
      ..add(DiagnosticsProperty('step', step))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('otpExpiresIn', otpExpiresIn))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('errorCode', errorCode))
      ..add(DiagnosticsProperty('isSuccess', isSuccess));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterStateImpl &&
            (identical(other.step, step) || other.step == step) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.otpExpiresIn, otpExpiresIn) ||
                other.otpExpiresIn == otpExpiresIn) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    step,
    phone,
    otpExpiresIn,
    isLoading,
    errorMessage,
    errorCode,
    isSuccess,
  );

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      __$$RegisterStateImplCopyWithImpl<_$RegisterStateImpl>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  const factory _RegisterState({
    final RegisterStep step,
    final String phone,
    final int otpExpiresIn,
    final bool isLoading,
    final String? errorMessage,
    final String? errorCode,
    final bool isSuccess,
  }) = _$RegisterStateImpl;

  @override
  RegisterStep get step;
  @override
  String get phone;
  @override
  int get otpExpiresIn;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  String? get errorCode;
  @override
  bool get isSuccess;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterStateImplCopyWith<_$RegisterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
