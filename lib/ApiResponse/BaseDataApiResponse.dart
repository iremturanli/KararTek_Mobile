// ignore_for_file: file_names
// class BaseDataApiResponse {
//   BaseDataApiResponse({
//     required this.data,
//     this.success,
//     this.message,
//   });

//   List<Type>? data;
//   bool? success;
//   String? message;

//   factory data.fromJson(Map<String, dynamic> json) =>
//       SearchDataApiResponse(
//         data: List<JudgmentListInformation>.from(
//             json["data"].map((x) => JudgmentListInformation.fromJson(x))),
//         success: json["success"],
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//         "success": success,
//         "message": message,
//       };
// }
