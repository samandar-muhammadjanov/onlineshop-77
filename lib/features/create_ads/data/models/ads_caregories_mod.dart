import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/ads_category_entity.dart';

part 'ads_caregories_mod.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AdsCategoriesModel extends AdsCategoriesEntity {
  const AdsCategoriesModel({
    super.id,
    super.name,
    super.adsCount,
    super.icon,
    super.parentCategory,
  });

  factory AdsCategoriesModel.fromJson(Map<String, dynamic> data) => _$AdsCategoriesModelFromJson(data);
}
