import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onlineshop_77/features/home/data/model/m_product.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<GetSearchProductsEvent>((event, emit) async {
      try {
        emit(SearchLoading());
        final products = await HomeRepository.getProducts(event.query);
        emit(SearchLoaded(products, event.query));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
