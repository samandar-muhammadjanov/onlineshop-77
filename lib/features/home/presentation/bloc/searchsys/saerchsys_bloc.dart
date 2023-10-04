import 'package:bloc/bloc.dart';

part 'saerchsys_event.dart';
part 'saerchsys_state.dart';

class SearchsysBloc extends Bloc<SearchsysEvent, SearchsysState> {
  SearchsysBloc() : super(SaerchsysInitial()) {
    on<OnSearchInitialEvent>((event, emit) {
      emit(OnSearchInitial());
    });
    on<OnSearchChangeEvent>((event, emit) {
      emit(OnSearchChange());
    });
    on<OnSearchResultEvent>((event, emit) {
      emit(OnSearchResult());
    });
    on<OnPopularSearchEvent>((event, emit) {
      emit(OnPopularSearch(event.query));
    });
  }
}
