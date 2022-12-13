import 'package:flutter_application_1/models/UserStatisticInformation/FilterUserStatisticDto.dart';

class UserStatisticFilterApiResponse {
  UserStatisticFilterApiResponse({
    required this.data,
    this.success,
    this.message,
  });

  List<FilterUserStatisticDto>? data;
  bool? success;
  String? message;

  factory UserStatisticFilterApiResponse.fromJson(Map<String, dynamic> json) =>
      UserStatisticFilterApiResponse(
        data: List<FilterUserStatisticDto>.from(
            json["data"].map((x) => FilterUserStatisticDto.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}
