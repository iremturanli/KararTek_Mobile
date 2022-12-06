import 'package:flutter_application_1/models/CityInformation/cityInformation.dart';
import 'package:flutter_application_1/models/CourtInformation/CourtInformation.dart';

//import '../models/CityInformation/cityInformation.dart';
import '../models/CommissionInformation/commissionInformation.dart';
import '../models/DistrictInformation/districtInformation.dart';
import '../models/UserInformation/userInformation.dart';

import 'mobileApiResponse.dart';

class DistrictInformationResponse {
  DistrictInformationResponse({
    required this.districtInformation,
    this.success,
    this.message,
  });

  List<DistrictInformation> districtInformation;

  bool? success;

  String? message;

  factory DistrictInformationResponse.fromJson(Map<String, dynamic> json) =>
      DistrictInformationResponse(
        districtInformation: List<DistrictInformation>.from(json["data"] != null
            ? json["data"].map((x) => DistrictInformation.fromJson(x))
            : []),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<DistrictInformation>.from(
            districtInformation.map((x) => x.toJson())),
        "success": success,
        "message": message,
      };
}
