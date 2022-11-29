import 'package:flutter_application_1/models/JudgmentInformation/judgmentInformation.dart';

import '../models/JudgmentInformation/judgmentListInformation.dart';

class SearchDataApiResponse {
  SearchDataApiResponse({
    required this.data,
    this.success,
    this.message,
  });

  List<JudgmentListInformation>? data;
  bool? success;
  String? message;

  factory SearchDataApiResponse.fromJson(Map<String, dynamic> json) =>
      SearchDataApiResponse(
        data: List<JudgmentListInformation>.from(
            json["data"].map((x) => JudgmentListInformation.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}
