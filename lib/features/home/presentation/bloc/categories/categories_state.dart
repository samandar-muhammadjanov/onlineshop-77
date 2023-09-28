part of 'categories_bloc.dart';

class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Categories> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String error;
  CategoriesError(this.error);
}
