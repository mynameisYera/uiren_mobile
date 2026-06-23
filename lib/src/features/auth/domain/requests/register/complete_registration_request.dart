import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uiren/src/core/base/base_models/base_request.dart';

part 'complete_registration_request.freezed.dart';
part 'complete_registration_request.g.dart';

@freezed
class CompleteRegistrationRequest extends BaseRequest with _$CompleteRegistrationRequest {
  const factory CompleteRegistrationRequest({
    required String phone,
    required String firstName,
    required String lastName,
    required String password,
    @Default('') String group,
  }) = _CompleteRegistrationRequest;

  factory CompleteRegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$CompleteRegistrationRequestFromJson(json);
}
