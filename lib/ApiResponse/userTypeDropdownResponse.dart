import 'package:flutter_application_1/models/UserTypeInformation/userTypeInformation.dart';

import '../models/UserInformation/userInformation.dart';

import 'mobileApiResponse.dart';

class UserTypeInformationResponse extends MobileApiResponse {
  UserTypeInformationResponse({
    required this.userTypeInformation,
    this.hasError,
    this.message,
  });

  List<UserTypeInformation> userTypeInformation;

  bool? hasError;

  String? message;

  factory UserTypeInformationResponse.fromJson(Map<String, dynamic> json) =>
      UserTypeInformationResponse(
        userTypeInformation: List<UserTypeInformation>.from(
            json["userTypes"] != null
                ? json["userTypes"].map((x) => UserTypeInformation.fromJson(x))
                : []),
        hasError: json["hasError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "userTypes": List<UserTypeInformation>.from(
            userTypeInformation.map((x) => x.toJson())),
        "hasError": hasError,
        "message": message,
      };
}
