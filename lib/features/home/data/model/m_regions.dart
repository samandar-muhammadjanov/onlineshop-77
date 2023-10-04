import 'dart:convert';

List<Regions> regionsFromJson(String str) => List<Regions>.from(json.decode(str).map((x) => Regions.fromJson(x)));

String regionsToJson(List<Regions> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Regions {
    int id;
    String name;
    List<District> districts;

    Regions({
        required this.id,
        required this.name,
        required this.districts,
    });

    factory Regions.fromJson(Map<String, dynamic> json) => Regions(
        id: json["id"],
        name: json["name"],
        districts: List<District>.from(json["districts"].map((x) => District.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
    };
}

class District {
    int id;
    String name;

    District({
        required this.id,
        required this.name,
    });

    factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
