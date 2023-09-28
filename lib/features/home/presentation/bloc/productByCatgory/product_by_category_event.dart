part of 'product_by_category_bloc.dart';

sealed class ProductByCategoryEvent extends Equatable {
  const ProductByCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetProductsByCategoryEvent extends ProductByCategoryEvent {
  final String query;
  const GetProductsByCategoryEvent(this.query);
}
