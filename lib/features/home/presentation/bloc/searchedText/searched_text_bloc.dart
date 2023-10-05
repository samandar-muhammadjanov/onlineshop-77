import 'package:bloc/bloc.dart';

part 'searched_text_event.dart';
part 'searched_text_state.dart';

class SearchedTextBloc extends Bloc<SearchedTextEvent, SearchedTextState> {
  SearchedTextBloc() : super(SearchedTextInitial()) {
    on<OnSearch>((event, emit) {
      emit(SearchedTextLoaded(event.text));
    });
  }
}
