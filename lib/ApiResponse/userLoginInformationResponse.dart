// ignore: file_names
import '../models/UserInformation/userInformation.dart';

import 'mobileApiResponse.dart';

class UserLoginInformationResponse extends MobileApiResponse {
  UserLoginInformationResponse({
    //this.userInformation,
    this.hasError,
    this.message,
    this.token,
  });

  //UserInformation? userInformation;
  String? token;
  bool? hasError;
  String? message;

  factory UserLoginInformationResponse.fromJson(Map<String, dynamic> json) =>
      UserLoginInformationResponse(
          // userInformation: UserInformation.fromJson(
          //     json["data"] == null ? {} : json["data"]),
          hasError: json["hasError"],
          message: json["message"],
          token: json["token"]);

  Map<String, dynamic> toJson() => {
        //"data": userInformation!.toJson(),
        "hasError": hasError,
        "message": message,
        "token": token
      };
}

//token for sharedlocalpreference