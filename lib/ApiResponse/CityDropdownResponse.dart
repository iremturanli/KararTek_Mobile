import 'package:flutter_application_1/models/CityInformation/CityInformation.dart';

//import '../models/CityInformation/cityInformation.dart';
import '../models/UserInformation/UserInformation.dart';

import 'mobileApiResponse.dart';

class CityInformationResponse extends MobileApiResponse {
  CityInformationResponse({
    required this.cityInformation,
    this.hasError,
    this.message,
  });

  List<CityInformation> cityInformation;

  bool? hasError;

  String? message;

  factory CityInformationResponse.fromJson(Map<String, dynamic> json) =>
      CityInformationResponse(
        cityInformation: List<CityInformation>.from(json["cities"] != null
            ? json["cities"].map((x) => CityInformation.fromJson(x))
            : []),
        hasError: json["hasError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "cities":
            List<CityInformation>.from(cityInformation.map((x) => x.toJson())),
        "hasError": hasError,
        "message": message,
      };
}
