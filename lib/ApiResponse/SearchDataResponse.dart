import 'package:flutter_application_1/models/JudgmentInformation/judgmentInformation.dart';

import '../models/JudgmentInformation/judgmentListInformation.dart';
import '../models/LawyerJudgmentInformation/LawyerJudgmentListInformation.dart';

class SearchDataApiResponse {
  SearchDataApiResponse({
    required this.data,
    this.success,
    this.message,
  });

  List<LawyerJudgmentListInformation>? data;
  bool? success;
  String? message;

  factory SearchDataApiResponse.fromJson(Map<String, dynamic> json) =>
      SearchDataApiResponse(
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
