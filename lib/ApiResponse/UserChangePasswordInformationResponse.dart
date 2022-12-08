import 'mobileApiResponse.dart';

class UserChangePasswordInformationResponse extends MobileApiResponse {
  UserChangePasswordInformationResponse({
    //this.userInformation,
    this.hasError,
    this.message,
    this.token,
  });

  //UserInformation? userInformation;
  String? token;
  bool? hasError;
  String? message;

  factory UserChangePasswordInformationResponse.fromJson(
          Map<String, dynamic> json) =>
      UserChangePasswordInformationResponse(
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
