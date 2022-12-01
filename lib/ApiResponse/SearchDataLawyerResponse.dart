import 'package:flutter_application_1/models/LawyerJudgmentInformation/lawyerJudgmentListInformation.dart';

import '../models/JudgmentInformation/judgmentListInformation.dart';

class SearchDataLawyerResponse {
  SearchDataLawyerResponse({
    required this.data,
    this.success,
    this.message,
  });

  List<LawyerJudgmentListInformation>? data;
  bool? success;
  String? message;

  factory SearchDataLawyerResponse.fromJson(Map<String, dynamic> json) =>
      SearchDataLawyerResponse(
        data: List<LawyerJudgmentListInformation>.from(
            json["data"].map((x) => LawyerJudgmentListInformation.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}
