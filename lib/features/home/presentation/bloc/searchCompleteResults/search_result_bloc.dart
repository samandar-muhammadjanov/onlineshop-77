import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

import '../../../data/model/m_search_result.dart';

part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchCompleteResultBloc
    extends Bloc<SearchCompleteResultEvent, SearchCompleteResultState> {
  SearchCompleteResultBloc() : super(SearchCompleteResultInitial()) {
    on<GetCompleteResultsEvent>((event, emit) async {
      try {
        emit(SearchCompleteResultLoading());
        final result = await HomeRepository.search(event.query);
        emit(SearchCompleteResultLoaded(result));
      } catch (e) {
        emit(SearchCompleteResultError(e.toString()));
      }
    });
  }
}
