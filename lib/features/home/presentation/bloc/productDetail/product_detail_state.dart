part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailState {}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailLoading extends ProductDetailState {}

final class ProductDetailLoaded extends ProductDetailState {
  final ProductDetail productDetail;
  ProductDetailLoaded(this.productDetail);
}

final class ProductDetailError extends ProductDetailState {
  final String error;
  ProductDetailError(this.error);
}
