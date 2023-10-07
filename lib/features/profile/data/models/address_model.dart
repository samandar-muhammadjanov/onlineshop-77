import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/profile/domain/entities/address_entity.dart';

part 'address_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AddressModel extends AddressEntity {
  const AddressModel({
    super.name,
    super.lat,
    super.long,
  });

  factory AddressModel.fromJson(Map<String, dynamic> data) => _$AddressModelFromJson(data);
}
