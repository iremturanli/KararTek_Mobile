import '../models/UserRegisterInformation/UserRegisterInformation.dart';
import 'mobileApiResponse.dart';

class UserRegisterInformationResponse extends MobileApiResponse {
  UserRegisterInformationResponse({
    this.userRegisterInformation,
    this.hasError,
    this.message,
  });

  UserRegisterInformation? userRegisterInformation;

  bool? hasError;

  String? message;

  factory UserRegisterInformationResponse.fromJson(Map<String, dynamic> json) =>
      UserRegisterInformationResponse(
        userRegisterInformation: UserRegisterInformation.fromJson(
            json["data"] == null ? {} : json["data"]),
        hasError: json["hasError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": userRegisterInformation!.toJson(),
        "hasError": hasError,
        "message": message,
      };
}
