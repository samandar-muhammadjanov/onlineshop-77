import 'package:bloc/bloc.dart';
import 'package:onlineshop_77/features/home/data/model/m_regions.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

part 'regions_event.dart';
part 'regions_state.dart';

class RegionsBloc extends Bloc<RegionsEvent, RegionsState> {
  RegionsBloc() : super(RegionsInitial()) {
    on<GetRegionsEvent>((event, emit) async {
      try {
        emit(RegionsLoading());
        final regions = await HomeRepository.getRegions();
        emit(RegionsLoaded(regions));
      } catch (e) {
        emit(RegionsError(e.toString()));
      }
    });
  }
}
