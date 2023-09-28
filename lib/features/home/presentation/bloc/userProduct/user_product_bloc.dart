import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

import '../../../data/model/m_my_products.dart';

part 'user_product_event.dart';
part 'user_product_state.dart';

class UserProductBloc extends Bloc<UserProductEvent, UserProductState> {
  UserProductBloc() : super(UserProductInitial()) {
    on<GetUserProducts>((event, emit) async {
      try {
        emit(UserProductLoading());
        final userProducts = await HomeRepository.getMyProducts();
        emit(UserProductLoaded(userProducts));
      } catch (e) {
        emit(UserProductError(e.toString()));
      }
    });
  }
}
