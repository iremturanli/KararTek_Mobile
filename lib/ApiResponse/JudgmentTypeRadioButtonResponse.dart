//import '../models/CityInformation/cityInformation.dart';
import 'package:flutter_application_1/models/JudgmentTypeInformation/judgmentTypeInformation.dart';

import '../models/CommissionInformation/commissionInformation.dart';

import 'mobileApiResponse.dart';

class JudgmentTypeInformationResponse extends MobileApiResponse {
  JudgmentTypeInformationResponse({
    required this.judgmentTypeInformation,
    this.hasError,
    this.message,
  });

  List<JudgmentTypeInformation> judgmentTypeInformation;

  bool? hasError;

  String? message;

  factory JudgmentTypeInformationResponse.fromJson(Map<String, dynamic> json) =>
      JudgmentTypeInformationResponse(
        judgmentTypeInformation: List<JudgmentTypeInformation>.from(
            json["judgmentTypes"] != null
                ? json["judgmentTypes"]
                    .map((x) => JudgmentTypeInformation.fromJson(x))
                : []),
        hasError: json["hasError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "commissions": List<JudgmentTypeInformation>.from(
            judgmentTypeInformation.map((x) => x.toJson())),
        "hasError": hasError,
        "message": message,
      };
}
