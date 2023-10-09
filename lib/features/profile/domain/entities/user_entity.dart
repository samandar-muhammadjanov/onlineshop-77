import 'package:equatable/equatable.dart';
import 'package:onlineshop_77/features/profile/domain/entities/address_entity.dart';

class UserEntity extends Equatable {
  final int id;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String profilePhoto;
  @AddressConverter()
  final AddressEntity address;

  const UserEntity({
    this.id = 0,
    this.fullName = '',
    this.email = '',
    this.phoneNumber = '',
    this.profilePhoto = '',
    this.address = const AddressEntity(),
  });

  @override
  List<Object?> get props => [
        id,
        fullName,
        email,
        phoneNumber,
        profilePhoto,
        address,
      ];
}
