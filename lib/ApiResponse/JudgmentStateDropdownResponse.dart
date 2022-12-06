import 'package:flutter_application_1/models/CityInformation/cityInformation.dart';
import 'package:flutter_application_1/models/JudgmentStateInformation/judgmentStateInformation.dart';

//import '../models/CityInformation/cityInformation.dart';
import '../models/UserInformation/userInformation.dart';

import 'mobileApiResponse.dart';

class JudgmentStateDropdownResponse extends MobileApiResponse {
  JudgmentStateDropdownResponse({
    required this.judgmentStateInformation,
    this.hasError,
    this.message,
  });

  List<JudgmentStateInformation> judgmentStateInformation;

  bool? hasError;

  String? message;

  factory JudgmentStateDropdownResponse.fromJson(Map<String, dynamic> json) =>
      JudgmentStateDropdownResponse(
        judgmentStateInformation: List<JudgmentStateInformation>.from(
            json["lawyerJudgmentStates"] != null
                ? json["lawyerJudgmentStates"]
                    .map((x) => JudgmentStateInformation.fromJson(x))
                : []),
        hasError: json["hasError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "cities": List<JudgmentStateInformation>.from(
            judgmentStateInformation.map((x) => x.toJson())),
        "hasError": hasError,
        "message": message,
      };
}
