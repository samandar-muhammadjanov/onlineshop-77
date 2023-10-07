import 'package:equatable/equatable.dart';

class FavoritesEntity extends Equatable {
  final int id;

  final String name;

  final String slug;

  final String description;

  final double price;

  final String currency;

  final String publishedAt;

  final String address;

  final String seller;

  final String photo;

  const FavoritesEntity({
    this.id = 0,
    this.name = '',
    this.slug = '',
    this.description = '',
    this.price = 0,
    this.currency = '',
    this.publishedAt = '',
    this.address = '',
    this.seller = '',
    this.photo = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
        slug,
        description,
        price,
        currency,
        publishedAt,
        address,
        seller,
        photo,
      ];
}
