// ignore_for_file: file_names

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
