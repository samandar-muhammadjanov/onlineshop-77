// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdsModel _$AdsModelFromJson(Map<String, dynamic> json) => AdsModel(
      extra: json['extra'] == null
          ? const ExtraEntity()
          : const ExtraConverter()
              .fromJson(json['extra'] as Map<String, dynamic>),
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      category: json['category'] == null
          ? const AdsCategoriesEntity()
          : const AdsCategoryConverter()
              .fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String? ?? '',
      price: json['price'] as String? ?? '',
      currency: json['currency'] as String? ?? 'uzs',
      publishedAt: json['published_at'] as String? ?? '',
      address: json['address'] as String? ?? '',
      seller: json['seller'] as String? ?? '',
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AdsModelToJson(AdsModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': const AdsCategoryConverter().toJson(instance.category),
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'published_at': instance.publishedAt,
      'address': instance.address,
      'seller': instance.seller,
      'photos': instance.photos,
      'extra': const ExtraConverter().toJson(instance.extra),
    };
