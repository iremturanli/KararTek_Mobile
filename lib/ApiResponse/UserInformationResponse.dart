import '../models/UserInformation/UserListInformation.dart';

class UserInformationResponse {
  UserInformationResponse({
    required this.data,
    this.success,
    this.message,
  });

  List<UserListInformation>? data;
  bool? success;
  String? message;

  factory UserInformationResponse.fromJson(Map<String, dynamic> json) =>
      UserInformationResponse(
        data: List<UserListInformation>.from(
            json["data"].map((x) => UserListInformation.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}
