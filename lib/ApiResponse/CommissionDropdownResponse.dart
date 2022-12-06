// ignore_for_file: file_names, overridden_fields

import 'package:flutter_application_1/models/CityInformation/cityInformation.dart';

//import '../models/CityInformation/cityInformation.dart';
import '../models/CommissionInformation/commissionInformation.dart';

import 'mobileApiResponse.dart';

class CommissionInformationResponse extends MobileApiResponse {
  CommissionInformationResponse({
    required this.commissionInformation,
    this.hasError,
    this.message,
  });

  List<CommissionInformation> commissionInformation;

  bool? hasError;

  String? message;

  factory CommissionInformationResponse.fromJson(Map<String, dynamic> json) =>
      CommissionInformationResponse(
        commissionInformation: List<CommissionInformation>.from(
            json["commissions"] != null
                ? json["commissions"]
                    .map((x) => CommissionInformation.fromJson(x))
                : []),
        hasError: json["hasError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "commissions": List<CityInformation>.from(
            commissionInformation.map((x) => x.toJson())),
        "hasError": hasError,
        "message": message,
      };
}
