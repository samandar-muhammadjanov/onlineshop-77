import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:onlineshop_77/core/usecases/usecase.dart';
import 'package:onlineshop_77/features/favorites/domain/entities/favorite_entity.dart';
import 'package:onlineshop_77/features/favorites/domain/usecase/get_favorites_usecase.dart';
import 'package:onlineshop_77/features/favorites/domain/usecase/make_favorite_usecase.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetFavoritesUseCase _favoritesUseCase = GetFavoritesUseCase();
  final MakeFavoriteUseCase _makeFavoriteUseCase = MakeFavoriteUseCase();

  FavoritesBloc() : super(const FavoritesState()) {
    on<StartFavorites>(
      (event, emit) async {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
        final result = await _favoritesUseCase(NoParams());
        if (result.isRight) {
          emit(state.copyWith(
            status: FormzSubmissionStatus.success,
            favoriteList: result.right,
          ));
        } else {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      },
    );

    on<AddToFavorites>(
      (event, emit) async {
        emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
        final result = await _makeFavoriteUseCase(event.favoritesEntity.id);
        if (result.isRight) {
          List<FavoritesEntity> newList = [...state.favoriteList];
          newList.remove(event.favoritesEntity);
          emit(state.copyWith(
            status: FormzSubmissionStatus.success,
            favoriteList: newList,
          ));
        } else {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        }
      },
    );

    on<RemoveToFavorites>(
      (event, emit) async {

      },
    );
  }
}
