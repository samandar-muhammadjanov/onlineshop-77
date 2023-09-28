import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  int id;
  String fullName;
  String email;
  String phoneNumber;
  String profilePhoto;
  Address address;

  UserData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.profilePhoto,
    required this.address,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        profilePhoto: json["profile_photo"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "profile_photo": profilePhoto,
        "address": address.toJson(),
      };
}

class Address {
  String name;
  double lat;
  double long;

  Address({
    required this.name,
    required this.lat,
    required this.long,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json["name"],
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "lat": lat,
        "long": long,
      };
}
