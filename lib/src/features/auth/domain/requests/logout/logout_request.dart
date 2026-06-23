// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/base/base_models/base_request.dart';

part 'logout_request.freezed.dart';
part 'logout_request.g.dart';

@freezed
class LogoutRequest extends BaseRequest with _$LogoutRequest {
  const factory LogoutRequest({
    @JsonKey(name: 'refreshToken') required String refreshToken,
  }) = _LogoutRequest;

  factory LogoutRequest.fromJson(Map<String, dynamic> json) =>
      _$LogoutRequestFromJson(json);
}
