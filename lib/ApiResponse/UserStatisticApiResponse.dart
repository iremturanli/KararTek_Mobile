import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';
import 'package:flutter_application_1/models/UserStatisticInformation/userStatisticInformation.dart';

import '../models/JudgmentInformation/judgmentListInformation.dart';

class UserStatisticApiResponse {
  UserStatisticApiResponse({
    required this.data,
    this.success,
    this.message,
  });

  List<UserStatisticInformation>? data;
  bool? success;
  String? message;

  factory UserStatisticApiResponse.fromJson(Map<String, dynamic> json) =>
      UserStatisticApiResponse(
        data: List<UserStatisticInformation>.from(
            json["data"].map((x) => UserStatisticInformation.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}
