import '../models/UserInformation/userInformation.dart';

import 'mobileApiResponse.dart';

class UserLoginInformationResponse extends MobileApiResponse {
  UserLoginInformationResponse({
    this.userInformation,
    this.hasError,
    this.message,
  });

  UserInformation? userInformation;

  bool? hasError;
  String? message;

  factory UserLoginInformationResponse.fromJson(Map<String, dynamic> json) =>
      UserLoginInformationResponse(
        userInformation:
            UserInformation.fromJson(json["data"] == null ? {} : json["data"]),
        hasError: json["hasError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": userInformation!.toJson(),
        "hasError": hasError,
        "message": message,
      };
}

//token for sharedlocalpreference