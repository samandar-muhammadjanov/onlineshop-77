import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onlineshop_77/features/home/data/model/m_product.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

part 'product_by_category_event.dart';
part 'product_by_category_state.dart';

class ProductByCategoryBloc
    extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
  ProductByCategoryBloc() : super(ProductByCategoryInitial()) {
    on<GetProductsByCategoryEvent>((event, emit) async {
      try {
        emit(ProductByCategoryLaoding());
        final products = await HomeRepository.getProducts(
            "?sub_category_ids=${event.query}");
        emit(ProductByCategoryLoaded(products));
      } catch (e) {
        emit(ProductByCategoryError(e.toString()));
      }
    });
  }
}
