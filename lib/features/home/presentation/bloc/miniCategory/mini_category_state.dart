part of 'mini_category_bloc.dart';

class MiniCategoryState extends Equatable {
  final String category;
  const MiniCategoryState(this.category);
  @override
  List<Object?> get props => [category];
}

final class MiniCategoryInitial extends MiniCategoryState {
  const MiniCategoryInitial(super.category);
}

class SelectCategory extends MiniCategoryState {
  const SelectCategory(super.category);
}
