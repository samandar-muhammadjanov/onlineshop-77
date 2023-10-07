import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/favorites/domain/entities/favorite_entity.dart';

part 'favorite_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FavoritesModel extends FavoritesEntity {
  const FavoritesModel({
    super.id,
    super.name,
    super.slug,
    super.description,
    super.price,
    super.currency,
    super.publishedAt,
    super.address,
    super.seller,
    super.photo,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => _$FavoritesModelFromJson(json);
}
