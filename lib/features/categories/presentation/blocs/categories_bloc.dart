import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:onlineshop_77/features/categories/domain/entities/categories_entity.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesState()) {
    on<GetCategoriesEvent>((event, emit) async {
      // try {
      //   emit(CategoriesLoading());
      //   final categories = await HomeRepository.getCategories();
      //   emit(CategoriesLoaded(categories));
      // } catch (e) {
      //   emit(CategoriesError(e.toString()));
      // }
    });
  }
}
