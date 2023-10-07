import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/profile/data/models/address_model.dart';

class AddressEntity extends Equatable {
  final String name;

  final double lat;

  final double long;

  const AddressEntity({
    this.name = '',
    this.lat = 0,
    this.long = 0,
  });

  @override
  List<Object?> get props => [
        name,
        lat,
        long,
      ];
}

class AddressConverter extends JsonConverter<AddressEntity, Map<String, dynamic>> {
  const AddressConverter();

  @override
  AddressEntity fromJson(Map<String, dynamic> json) => AddressModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(AddressEntity object) => {};
}
