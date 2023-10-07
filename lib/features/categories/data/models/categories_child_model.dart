import 'package:onlineshop_77/features/categories/domain/entities/categories_child_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_child_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryChildModel extends CategoriesChildEntity {
  const CategoryChildModel({
    super.childs,
    super.id,
    super.name,
  });

  factory CategoryChildModel.fromJson(Map<String, dynamic> data) => _$CategoryChildModelFromJson(data);

}
