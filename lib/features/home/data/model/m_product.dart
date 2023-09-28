// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'm_product.g.dart';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  int count;
  String next;
  dynamic previous;
  List<Result> results;

  Products({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 0)
class Result extends Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String slug;
  @HiveField(3)
  dynamic category;
  @HiveField(4)
  String description;
  @HiveField(5)
  int price;
  @HiveField(6)
  String currency;
  @HiveField(7)
  DateTime publishedAt;
  @HiveField(8)
  Address address;
  @HiveField(9)
  Seller seller;
  @HiveField(10)
  List<String> photos;
  @HiveField(11)
  Extra extra;

  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        category: json["category"] ?? "",
        description: json["description"],
        price: json["price"],
        currency: json["currency"],
        publishedAt: DateTime.parse(json["published_at"]),
        address: Address.fromJson(json["address"] ?? {}),
        seller: Seller.fromJson(json["seller"] ?? {}),
        photos: List<String>.from(json["photos"].map((x) => x)),
        extra: Extra.fromJson(json["extra"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "category": category,
        "description": description,
        "price": price,
        "currency": currency,
        "published_at": publishedAt.toIso8601String(),
        "address": address.toJson(),
        "seller": seller.toJson(),
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "extra": extra.toJson(),
      };

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        category,
        description,
        price,
        currency,
        publishedAt,
        address,
        seller,
        photos,
        extra
      ];
}

@HiveType(typeId: 1)
class Address extends Equatable {
  @HiveField(0)
  District district;
  @HiveField(1)
  String name;
  @HiveField(2)
  double lat;
  @HiveField(3)
  double long;

  Address({
    required this.district,
    required this.name,
    required this.lat,
    required this.long,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        district: District.fromJson(json["district"] ?? {}),
        name: json["name"] ?? "",
        lat: json["lat"] ?? 0.0,
        long: json["long"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "district": district.toJson(),
        "name": name,
        "lat": lat,
        "long": long,
      };

  @override
  List<Object?> get props => [district, name, lat, long];
}

@HiveType(typeId: 2)
class District extends Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  Region region;

  District({
    required this.id,
    required this.name,
    required this.region,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        region: Region.fromJson(json["region"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "region": region.toJson(),
      };

  @override
  List<Object?> get props => [id, name, region];
}

@HiveType(typeId: 3)
class Region extends Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;

  Region({
    required this.id,
    required this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object?> get props => [id, name];
}

@HiveType(typeId: 4)
class Category extends Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  int adsCount;
  @HiveField(3)
  String icon;
  @HiveField(4)
  dynamic parentCategory;

  Category({
    required this.id,
    required this.name,
    required this.adsCount,
    required this.icon,
    required this.parentCategory,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        adsCount: json["ads_count"] ?? 0,
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

  @override
  List<Object?> get props => [id, name, adsCount, icon, parentCategory];
}

@HiveType(typeId: 5)
class Extra extends Equatable {
  @HiveField(0)
  bool isMine;
  @HiveField(1)
  String status;
  @HiveField(2)
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

  @override
  List<Object?> get props => [isMine, status, expiresAt];
}

@HiveType(typeId: 6)
class Seller extends Equatable {
  @HiveField(0)
  int id;
  @HiveField(1)
  String fullName;
  @HiveField(2)
  String profilePhoto;
  @HiveField(3)
  String phoneNumber;

  Seller({
    required this.id,
    required this.fullName,
    required this.profilePhoto,
    required this.phoneNumber,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"] ?? 0,
        fullName: json["full_name"] ?? "",
        profilePhoto: json["profile_photo"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "profile_photo": profilePhoto,
        "phone_number": phoneNumber,
      };

  @override
  List<Object?> get props => [id, fullName, profilePhoto, phoneNumber];
}
