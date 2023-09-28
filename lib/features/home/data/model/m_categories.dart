import 'dart:convert';

List<Categories> categoriesFromJson(String str) =>
    List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  int id;
  String name;
  int adsCount;
  String icon;
  List<CategoryChild> childs;
  bool? isChecked;
  Categories(
      {required this.id,
      required this.name,
      required this.adsCount,
      required this.icon,
      required this.childs,
      this.isChecked = false});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        adsCount: json["ads_count"],
        icon: json["icon"],
        childs: List<CategoryChild>.from(
            json["childs"].map((x) => CategoryChild.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ads_count": adsCount,
        "icon": icon,
        "childs": List<dynamic>.from(childs.map((x) => x.toJson())),
      };
}

class CategoryChild {
  int id;
  String name;
  dynamic childs;
  bool? isChecked;
  CategoryChild(
      {required this.id,
      required this.name,
      required this.childs,
      this.isChecked = false});

  factory CategoryChild.fromJson(Map<String, dynamic> json) => CategoryChild(
        id: json["id"],
        name: json["name"],
        childs: json["childs"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "childs": childs,
      };
}
