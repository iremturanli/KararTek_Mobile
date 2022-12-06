// ignore_for_file: file_names

import 'package:flutter_application_1/models/SearchTypeInformation/searchTypeInformation.dart';

import 'mobileApiResponse.dart';

class SearchTypeInformationResponse extends MobileApiResponse {
  SearchTypeInformationResponse({
    required this.searchTypeInformation,
    this.hasError,
    this.message,
  });

  List<SearchTypeInformation> searchTypeInformation;

  bool? hasError;

  String? message;

  factory SearchTypeInformationResponse.fromJson(Map<String, dynamic> json) =>
      SearchTypeInformationResponse(
        searchTypeInformation: List<SearchTypeInformation>.from(
            json["searchTypes"] != null
                ? json["searchTypes"]
                    .map((x) => SearchTypeInformation.fromJson(x))
                : []),
        hasError: json["hasError"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "searchTypes": List<SearchTypeInformation>.from(
            searchTypeInformation.map((x) => x.toJson())),
        "hasError": hasError,
        "message": message,
      };
}
