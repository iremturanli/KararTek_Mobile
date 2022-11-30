// ignore: file_names
import 'package:flutter_application_1/models/JudgmentInformation/judgmentInformation.dart';

import '../models/JudgmentInformation/judgmentListInformation.dart';

class BaseResponseApi {
  BaseResponseApi({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory BaseResponseApi.fromJson(Map<String, dynamic> json) =>
      BaseResponseApi(
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
      };
}
