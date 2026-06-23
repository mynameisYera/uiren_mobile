import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uiren/src/core/base/base_models/base_request.dart';

part 'verify_otp_request.freezed.dart';
part 'verify_otp_request.g.dart';

@freezed
class VerifyOtpRequest extends BaseRequest with _$VerifyOtpRequest {
  const factory VerifyOtpRequest({
    required String phone,
    required String otp,
  }) = _VerifyOtpRequest;

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestFromJson(json);
}
