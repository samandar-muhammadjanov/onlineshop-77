part of 'product_bloc.dart';

class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final Products products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
