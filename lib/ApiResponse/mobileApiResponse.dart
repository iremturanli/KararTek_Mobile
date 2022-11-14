class MobileApiResponse {
  MobileApiResponse({
    this.hasError,
    this.errorMessage,
  });

  bool? hasError;
  String? errorMessage;

  factory MobileApiResponse.fromJson(Map<String, dynamic> json) =>
      MobileApiResponse(
        hasError: json["success"],
        errorMessage: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": hasError,
        "message": errorMessage,
      };
}
