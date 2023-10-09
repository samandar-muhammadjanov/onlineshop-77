import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:onlineshop_77/core/usecases/usecase.dart';
import 'package:onlineshop_77/features/home/doman/entity/region_entity.dart';
import 'package:onlineshop_77/features/profile/domain/usecase/get_regions_usecase.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetRegionsUseCase _getRegionsUseCase = GetRegionsUseCase();

  SearchBloc() : super(const SearchState()) {
    on<GetSearchProductsEvent>((event, emit) async {});
    on<GetRegionsEvent>(
      (event, emit) async {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
        final result = await _getRegionsUseCase(NoParams());
        if (result.isRight) {
          emit(state.copyWith(regionEntity: result.right));
        } else {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      },
    );
  }
}
