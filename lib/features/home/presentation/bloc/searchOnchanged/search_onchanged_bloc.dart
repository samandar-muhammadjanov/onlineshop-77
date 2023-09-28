import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_onchanged_event.dart';
part 'search_onchanged_state.dart';

class SearchOnchangedBloc
    extends Bloc<SearchOnchangedEvent, SearchOnchangedState> {
  SearchOnchangedBloc()
      : super(const SearchOnchangedInitial(isChanged: false)) {
    on<OnchangeEvent>((event, emit) {
      emit(const SearchOnchangedState(true));
    });
    on<OnUnchangeEvent>((event, emit) {
      emit(const SearchOnchangedState(false));
    });
  }
}
