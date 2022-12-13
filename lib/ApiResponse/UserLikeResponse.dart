// ignore: file_names
import 'package:flutter_application_1/models/ForLikeInformation/forLikeDto.dart';
import 'package:flutter_application_1/models/ForLikeInformation/forLikeList.dart';
import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';

class UserLikeResponse {
  UserLikeResponse({
    required this.data,
    this.success,
    this.message,
  });

  List<ForLikeList>? data;
  bool? success;
  String? message;

  factory UserLikeResponse.fromJson(Map<String, dynamic> json) =>
      UserLikeResponse(
        data: List<ForLikeList>.from(
            json["data"].map((x) => ForLikeList.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}
