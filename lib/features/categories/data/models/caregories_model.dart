import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/categories/domain/entities/categories_entity.dart';

import '../../domain/entities/categories_child_entity.dart';

part 'caregories_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoriesModel extends CategoriesEntity {
  const CategoriesModel({
    super.id,
    super.name,
    super.adsCount,
    super.icon,
    super.childs,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> data) => _$CategoriesModelFromJson(data);
}
