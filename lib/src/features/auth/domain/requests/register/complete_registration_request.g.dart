// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_registration_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompleteRegistrationRequestImpl _$$CompleteRegistrationRequestImplFromJson(
  Map<String, dynamic> json,
) => _$CompleteRegistrationRequestImpl(
  phone: json['phone'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  password: json['password'] as String,
  group: json['group'] as String? ?? '',
);

Map<String, dynamic> _$$CompleteRegistrationRequestImplToJson(
  _$CompleteRegistrationRequestImpl instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'password': instance.password,
  'group': instance.group,
};
