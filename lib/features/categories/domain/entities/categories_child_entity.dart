import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:onlineshop_77/features/categories/data/models/categories_child_model.dart';

class CategoriesChildEntity extends Equatable {
  final int id;
  final String name;
  @CtgChildConverter()
  final List<CategoriesChildEntity>? childs;
  final bool? isChecked;

  const CategoriesChildEntity({
    this.id = 0,
    this.name = '',
    this.childs = const [],
    this.isChecked = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        childs,
        isChecked,
      ];
}

class CtgChildConverter extends JsonConverter<CategoriesChildEntity, Map<String, dynamic>> {
  @override
  CategoriesChildEntity fromJson(Map<String, dynamic> json) => CategoryChildModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(CategoriesChildEntity object) => {};

  const CtgChildConverter();
}
