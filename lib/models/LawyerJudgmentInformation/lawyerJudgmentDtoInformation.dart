class LawyerJudgmentDtoInformation {
  LawyerJudgmentDtoInformation({
    required this.keyword,
    required this.searchTypeID,
    this.judgmentTypeID,
  });

  String? keyword;
  int? searchTypeID;
  int? judgmentTypeID;

  factory LawyerJudgmentDtoInformation.fromJson(Map<String, dynamic> json) =>
      LawyerJudgmentDtoInformation(
          keyword: json["keyword"],
          searchTypeID: json["searchTypeId"],
          judgmentTypeID: json["judgmentTypeId"]);
  Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "searchTypeId": searchTypeID,
        "judgmentTypeId": judgmentTypeID
      };
}
