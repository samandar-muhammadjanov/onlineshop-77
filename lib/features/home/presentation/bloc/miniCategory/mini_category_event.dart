part of 'mini_category_bloc.dart';

class MiniCategoryEvent {}

class SetCategoryEvent extends MiniCategoryEvent {
  final String category;
  SetCategoryEvent(this.category);
}
