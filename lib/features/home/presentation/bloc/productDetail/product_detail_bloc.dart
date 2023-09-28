import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/features/home/data/model/m_product_detail.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(ProductDetailInitial()) {
    on<GetProductDetail>((event, emit) async {
      try {
        emit(ProductDetailLoading());
        final productDetail = await HomeRepository.getProductDetail(event.slug);
        emit(ProductDetailLoaded(productDetail));
      } catch (e) {
        emit(ProductDetailError(e.toString()));
      }
    });
  }
}
