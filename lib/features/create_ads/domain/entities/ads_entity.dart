import 'package:equatable/equatable.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/ads_category_entity.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/extra_entity.dart';

class AdsEntity extends Equatable {
  final String id;

  final String name;

  final String slug;

  @AdsCategoryConverter()
  final AdsCategoriesEntity category;

  final String description;

  final String price;

  final String currency;

  final String publishedAt;

  final String address;

  final String seller;

  final List<String> photos;

  @ExtraConverter()
  final ExtraEntity extra;

  const AdsEntity({
    this.extra = const ExtraEntity(),
    this.id = '',
    this.name = '',
    this.slug = '',
    this.category = const AdsCategoriesEntity(),
    this.description = '',
    this.price = '',
    this.currency = 'uzs',
    this.publishedAt = '',
    this.address = '',
    this.seller = '',
    this.photos = const [],
  });

  @override
  List<Object?> get props => [
        extra,
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
      ];
}
