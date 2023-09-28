import 'package:bloc/bloc.dart';
import 'package:onlineshop_77/features/home/data/model/m_popular_search.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

part 'popular_searchs_event.dart';
part 'popular_searchs_state.dart';

class PopularSearchsBloc
    extends Bloc<PopularSearchsEvent, PopularSearchsState> {
  PopularSearchsBloc() : super(PopularSearchsInitial()) {
    on<PopularSearchsEvent>((event, emit) async {
      try {
        emit(PopularSearchsLoading());
        final popularSearchs = await HomeRepository.getPopularSaerchs();
        emit(PopularSearchsLoaded(popularSearchs));
      } catch (e) {
        emit(PopularSearchsError(e.toString()));
      }
    });
  }
}
