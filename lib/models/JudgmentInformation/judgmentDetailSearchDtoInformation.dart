class JudgmentDetailSearchDto {
  JudgmentDetailSearchDto({
    this.keyword,
    this.commissionId,
    this.courtId,
    this.meritsYear,
    this.meritsFirstOrder,
    this.meritsLastOrder,
    this.decreeYear,
    this.decreeFirstOrder,
    this.decreeLastOrder,
    this.firstDate,
    this.lastDate,
    this.searchTypeID,
    this.judgmentTypeID,
  });

  String? keyword;
  int? commissionId;
  int? courtId;
  String? meritsYear;
  String? meritsFirstOrder;
  String? meritsLastOrder;
  String? decreeYear;
  String? decreeFirstOrder;
  String? decreeLastOrder;
  DateTime? firstDate;
  DateTime? lastDate;
  int? searchTypeID;
  int? judgmentTypeID;

  factory JudgmentDetailSearchDto.fromJson(Map<String, dynamic> json) =>
      JudgmentDetailSearchDto(
          keyword: json["keyword"],
          commissionId: json["commissionId"],
          courtId: json["courtId"],
          meritsYear: json["meritsYear"],
          meritsFirstOrder: json["meritsFirstOrder"],
          meritsLastOrder: json["meritsLastOrder"],
          decreeYear: json["decreeYear"],
          decreeFirstOrder: json["decreeFirstOrder"],
          decreeLastOrder: json["decreeLastOrder"],
          firstDate: DateTime.parse(json["firstDate"]),
          lastDate: DateTime.parse(json["lastDate"]),
          searchTypeID: json["searchTypeId"],
          judgmentTypeID: json["judgmentTypeId"]);

  Map<String, dynamic> toJson() => {
        "keyword": keyword,
        "commissionId": commissionId,
        "courtId": courtId,
        "meritsYear": meritsYear,
        "meritsFirstOrder": meritsFirstOrder,
        "meritsLastOrder": meritsLastOrder,
        "decreeYear": decreeYear,
        "decreeFirstOrder": decreeFirstOrder,
        "decreeLastOrder": decreeLastOrder,
        "firstDate": firstDate?.toIso8601String(),
        "lastDate": lastDate?.toIso8601String(),
        "searchTypeId": searchTypeID,
        "judgmentTypeId": judgmentTypeID
      };
}
