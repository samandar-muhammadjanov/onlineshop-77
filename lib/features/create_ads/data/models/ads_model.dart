import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/ads_category_entity.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/ads_entity.dart';
import 'package:onlineshop_77/features/create_ads/domain/entities/extra_entity.dart';

part 'ads_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AdsModel extends AdsEntity {
  const AdsModel({
    super.id,
    super.name,
    super.slug,
    super.category,
    super.description,
    super.price,
    super.currency,
    super.publishedAt,
    super.address,
    super.seller,
    super.photos,
    super.extra,
  });

  factory AdsModel.fromJson(Map<String, dynamic> json) => _$AdsModelFromJson(json);
}
