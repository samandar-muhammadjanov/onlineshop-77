part of 'user_product_bloc.dart';

@immutable
sealed class UserProductState {}

final class UserProductInitial extends UserProductState {}

final class UserProductLoading extends UserProductState {}

final class UserProductLoaded extends UserProductState {
  final List<MyProducts> userProducts;
  UserProductLoaded(this.userProducts);
}

final class UserProductError extends UserProductState {
  final String error;
  UserProductError(this.error);
}
