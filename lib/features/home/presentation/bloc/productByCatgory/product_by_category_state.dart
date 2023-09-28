part of 'product_by_category_bloc.dart';

sealed class ProductByCategoryState extends Equatable {
  const ProductByCategoryState();

  @override
  List<Object> get props => [];
}

final class ProductByCategoryInitial extends ProductByCategoryState {}

final class ProductByCategoryLaoding extends ProductByCategoryState {}

final class ProductByCategoryLoaded extends ProductByCategoryState {
  final Products products;
  const ProductByCategoryLoaded(this.products);
}

final class ProductByCategoryError extends ProductByCategoryState {
  final String error;
  const ProductByCategoryError(this.error);
}
