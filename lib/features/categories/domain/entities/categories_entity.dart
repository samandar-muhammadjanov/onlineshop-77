import 'package:equatable/equatable.dart';
import 'package:onlineshop_77/features/categories/domain/entities/categories_child_entity.dart';

class CategoriesEntity extends Equatable {
  final int id;
  final String name;
  final int adsCount;
  final String icon;
  @CtgChildConverter()
  final List<CategoriesChildEntity> childs;
  final bool isChecked;

  const CategoriesEntity({
    this.id = 0,
    this.name = '',
    this.adsCount = 0,
    this.icon = '',
    this.childs = const [],
    this.isChecked = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        adsCount,
        icon,
        childs,
        isChecked,
      ];
}
