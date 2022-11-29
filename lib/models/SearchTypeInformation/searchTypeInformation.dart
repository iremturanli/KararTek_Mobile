// ignore_for_file:  file_names, avoid_print,prefer_const_constructors_in_immutables,prefer_const_constructors,prefer_const_literals_to_create_immutables

class SearchTypeInformation {
  SearchTypeInformation({
    this.TypeID,
    this.TypeName,
  });

  int? TypeID;
  String? TypeName;

  factory SearchTypeInformation.fromJson(Map<String, dynamic> json) =>
      SearchTypeInformation(TypeID: json["typeId"], TypeName: json["typeName"]);

  Map<String, dynamic> toJson() => {
        "typeId": TypeID,
        "typeName": TypeName,
      };
}