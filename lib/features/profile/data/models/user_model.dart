import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/profile/domain/entities/address_entity.dart';
import 'package:onlineshop_77/features/profile/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.fullName,
    super.email,
    super.phoneNumber,
    super.profilePhoto,
    super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) => _$UserModelFromJson(data);
}
