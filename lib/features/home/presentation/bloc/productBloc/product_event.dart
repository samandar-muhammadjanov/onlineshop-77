part of 'product_bloc.dart';

class ProductEvent {}

class GetProductsEvent extends ProductEvent {
  final String parametr;
  GetProductsEvent(this.parametr);
}
