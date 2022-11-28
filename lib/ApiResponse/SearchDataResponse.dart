import 'package:flutter_application_1/models/JudgmentInformation/judgmentInformation.dart';

class SearchDataApiResponse {
  SearchDataApiResponse({
    this.data,
    this.success,
    this.message,
  });

  List<JudgmentInformation>? data;
  bool? success;
  String? message;

  factory SearchDataApiResponse.fromJson(Map<String, dynamic> json) =>
      SearchDataApiResponse(
        data: List<JudgmentInformation>.from(
            json["data"].map((x) => JudgmentInformation.fromJson(x))),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}
