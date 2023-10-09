import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/categories/domain/entities/categories_child_entity.dart';
import 'package:onlineshop_77/features/create_ads/data/models/ads_caregories_mod.dart';

class AdsCategoriesEntity extends Equatable {
  final int id;
  final String name;
  final int adsCount;
  final String icon;
  @AdsCategoryConverter()
  final AdsCategoriesEntity? parentCategory;

  const AdsCategoriesEntity({
    this.id = 0,
    this.name = '',
    this.adsCount = 0,
    this.icon = '',
    this.parentCategory,
  });

  bool isNotEmpty() => id != 0 && name.isNotEmpty && adsCount != 0 && icon.isNotEmpty;

  @override
  List<Object?> get props => [
        id,
        name,
        adsCount,
        icon,
        parentCategory,
      ];
}

class AdsCategoryConverter extends JsonConverter<AdsCategoriesEntity, Map<String, dynamic>> {
  @override
  AdsCategoriesEntity fromJson(Map<String, dynamic> json) => AdsCategoriesModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(AdsCategoriesEntity object) => {};

  const AdsCategoryConverter();
}
