import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uiren/src/core/base/base_models/base_request.dart';

part 'request_otp_request.freezed.dart';
part 'request_otp_request.g.dart';

@freezed
class RequestOtpRequest extends BaseRequest with _$RequestOtpRequest {
  const factory RequestOtpRequest({
    required String phone,
  }) = _RequestOtpRequest;

  factory RequestOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$RequestOtpRequestFromJson(json);
}
