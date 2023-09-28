import 'package:bloc/bloc.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

import '../../../data/model/m_categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<GetCategoriesEvent>((event, emit) async {
      try {
        emit(CategoriesLoading());
        final categories = await HomeRepository.getCategories();
        emit(CategoriesLoaded(categories));
      } catch (e) {
        emit(CategoriesError(e.toString()));
      }
    });
  }
}
