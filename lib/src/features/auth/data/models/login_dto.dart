import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/base/base_models/base_dto.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@freezed
class LoginDto extends BaseDto with _$LoginDto {
  const factory LoginDto({
    required String refresh,
    required String access,
  }) = _LoginDto;

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
}
