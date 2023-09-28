import 'dart:convert';

List<MyProducts> myProductsFromJson(String str) =>
    List<MyProducts>.from(json.decode(str).map((x) => MyProducts.fromJson(x)));

String myProductsToJson(List<MyProducts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyProducts {
  int id;
  String name;
  String slug;
  Category category;
  String description;
  int price;
  String currency;
  DateTime publishedAt;
  Address address;
  Seller seller;
  List<String> photos;
  Extra extra;

  MyProducts({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
    required this.description,
    required this.price,
    required this.currency,
    required this.publishedAt,
    required this.address,
    required this.seller,
    required this.photos,
    required this.extra,
  });

  factory MyProducts.fromJson(Map<String, dynamic> json) => MyProducts(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        category: Category.fromJson(json["category"]),
        description: json["description"],
        price: json["price"],
        currency: json["currency"],
        publishedAt: DateTime.parse(json["published_at"]),
        address: Address.fromJson(json["address"]),
        seller: Seller.fromJson(json["seller"]),
        photos: List<String>.from(json["photos"].map((x) => x)),
        extra: Extra.fromJson(json["extra"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "category": category.toJson(),
        "description": description,
        "price": price,
        "currency": currency,
        "published_at": publishedAt.toIso8601String(),
        "address": address.toJson(),
        "seller": seller.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "extra": extra.toJson(),
      };
}

class Address {
  District district;
  String name;
  double lat;
  double long;

  Address({
    required this.district,
    required this.name,
    required this.lat,
    required this.long,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        district: District.fromJson(json["district"]),
        name: json["name"],
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "district": district.toJson(),
        "name": name,
        "lat": lat,
        "long": long,
      };
}

class District {
  int id;
  String name;
  Region region;

  District({
    required this.id,
    required this.name,
    required this.region,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
        region: Region.fromJson(json["region"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region.toJson(),
      };
}

class Region {
  int id;
  String name;

  Region({
    required this.id,
    required this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Category {
  int id;
  String name;
  int adsCount;
  String icon;
  dynamic parentCategory;

  Category({
    required this.id,
    required this.name,
    required this.adsCount,
    required this.icon,
    required this.parentCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        adsCount: json["ads_count"] ?? "",
        icon: json["icon"] ?? "",
        parentCategory: json["parent_category"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ads_count": adsCount,
        "icon": icon,
        "parent_category": parentCategory,
      };
}

class Extra {
  bool isMine;
  String status;
  DateTime expiresAt;

  Extra({
    required this.isMine,
    required this.status,
    required this.expiresAt,
  });

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        isMine: json["is_mine"],
        status: json["status"],
        expiresAt: DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "is_mine": isMine,
        "status": status,
        "expires_at":
            "${expiresAt.year.toString().padLeft(4, '0')}-${expiresAt.month.toString().padLeft(2, '0')}-${expiresAt.day.toString().padLeft(2, '0')}",
      };
}

class Seller {
  int id;
  String fullName;
  String profilePhoto;
  String phoneNumber;

  Seller({
    required this.id,
    required this.fullName,
    required this.profilePhoto,
    required this.phoneNumber,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        fullName: json["full_name"],
        profilePhoto: json["profile_photo"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "profile_photo": profilePhoto,
        "phone_number": phoneNumber,
      };
}
