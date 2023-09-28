import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryInitial("", 0)) {
    on<CategoryEvent>((event, emit) {
      emit(CategoryState(event.name, event.id));
    });
  }
}
