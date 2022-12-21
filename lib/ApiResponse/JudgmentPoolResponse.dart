import 'JudgmentPoolApiResponse.dart';

class JudgmentPoolResponse {
  JudgmentPoolResponse({
    this.data,
    this.success,
    this.message,
  });

  JudgmentPoolApiResponse? data;
  bool? success;
  String? message;

  factory JudgmentPoolResponse.fromJson(Map<String, dynamic> json) =>
      JudgmentPoolResponse(
        data: JudgmentPoolApiResponse.fromJson(json["data"]),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "success": success,
        "message": message,
      };
}
