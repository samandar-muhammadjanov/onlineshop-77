import 'package:bloc/bloc.dart';
import 'package:onlineshop_77/features/home/data/model/m_product.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductsEvent>((event, emit) async {
      try {
        emit(ProductLoading());
        final products = await HomeRepository.getProducts(event.parametr);
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
