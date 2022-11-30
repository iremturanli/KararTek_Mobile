class MobileApiResponse {
  MobileApiResponse({
    this.hasError,
    this.errorMessage,
    this.success,
  });

  bool? hasError;
  String? errorMessage;
  bool? success;

  factory MobileApiResponse.fromJson(Map<String, dynamic> json) =>
      MobileApiResponse(
          hasError: json["hasError"],
          errorMessage: json["message"],
          success: json["success"]);

  Map<String, dynamic> toJson() =>
      {"hasError": hasError, "message": errorMessage, "success": success};
}
