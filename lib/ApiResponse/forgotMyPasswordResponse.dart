import 'package:flutter_application_1/models/ForgotMyPasswordInformation.dart/forgotMyPasswordInformation.dart';

import '../models/UserInformation/userInformation.dart';

import 'mobileApiResponse.dart';

class ForgotMyPasswordInformationResponse extends MobileApiResponse {
  ForgotMyPasswordInformationResponse({
    this.forgotMyPasswordInformation,
    this.hasError,
    this.message,
  });

  ForgotMyPasswordInformation? forgotMyPasswordInformation;

  bool? hasError;

  String? message;

  factory ForgotMyPasswordInformationResponse.fromJson(
          Map<String, dynamic> json) =>
      ForgotMyPasswordInformationResponse(
        forgotMyPasswordInformation: ForgotMyPasswordInformation.fromJson(
            json["data"] == null ? {} : json["data"]),
        hasError: json["hasError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": forgotMyPasswordInformation!.toJson(),
        "hasError": hasError,
        "message": message,
      };
}
