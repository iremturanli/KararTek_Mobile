import 'package:flutter_application_1/models/CityInformation/cityInformation.dart';
import 'package:flutter_application_1/models/CourtInformation/CourtInformation.dart';

//import '../models/CityInformation/cityInformation.dart';
import '../models/CommissionInformation/commissionInformation.dart';
import '../models/UserInformation/userInformation.dart';

import 'mobileApiResponse.dart';

class CourtInformationResponse extends MobileApiResponse {
  CourtInformationResponse({
    required this.courtInformation,
    this.success,
    this.message,
  });

  List<CourtInformation> courtInformation;

  bool? success;

  String? message;

  factory CourtInformationResponse.fromJson(Map<String, dynamic> json) =>
      CourtInformationResponse(
        courtInformation: List<CourtInformation>.from(json["courts"] != null
            ? json["courts"].map((x) => CourtInformation.fromJson(x))
            : []),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "courts": List<CourtInformation>.from(
            courtInformation.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}
