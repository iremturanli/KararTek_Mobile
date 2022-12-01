// ignore_for_file:  file_names, avoid_print,prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter_application_1/models/SearchTypeInformation/searchTypeInformation.dart';

class JudgmentDtoInformation {
  JudgmentDtoInformation({
    required this.keyword,
    required this.searchTypeID,
    this.judgmentTypeID,
  });

  String? keyword;
  int? searchTypeID;
  int? judgmentTypeID;

  factory JudgmentDtoInformation.fromJson(Map<String, dynamic> json) =>
      JudgmentDtoInformation(
          keyword: json["keyword"],
          searchTypeID: json["searchTypeId"],
          judgmentTypeID: json["judgmentTypeId"]);
  Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "searchTypeId": searchTypeID,
        "judgmentTypeId": judgmentTypeID
      };
}
