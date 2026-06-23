// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdatePasswordRequestImpl _$$UpdatePasswordRequestImplFromJson(
  Map<String, dynamic> json,
) => _$UpdatePasswordRequestImpl(
  otpSession: json['otp_session'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$$UpdatePasswordRequestImplToJson(
  _$UpdatePasswordRequestImpl instance,
) => <String, dynamic>{
  'otp_session': instance.otpSession,
  'password': instance.password,
};
