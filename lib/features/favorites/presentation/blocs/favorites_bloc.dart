// ignore_for_file: unused_field, invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/storage/local_storage_repository.dart';
import '../../../home/data/model/m_favorites.dart';
import '../../../home/data/model/m_product.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final LocalstorageRepository _localstorageRepository;

  FavoritesBloc({
    required LocalstorageRepository localstorageRepository,
  })  : _localstorageRepository = localstorageRepository,
        super(FavoritesLoading()) {
    on<StartFavorites>((event, emit) => _startFavorites());
    on<AddToFavorites>((event, emit) => _addFavorites(event, state));
    on<RemoveFromFavorites>((event, emit) => _removeFavorites(event, state));
  }

  void _startFavorites() async {
    emit(FavoritesLoading());
    try {
      Box box = await _localstorageRepository.openBox();
      List<Result> products = _localstorageRepository.getFavorites(box);
      await Future.delayed(const Duration(seconds: 1));
      emit(FavoritesLoaded(Favorites(products: products)));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  void _addFavorites(
    AddToFavorites event,
    FavoritesState state,
  ) async {
    if (state is FavoritesLoaded) {
      try {
        Box box = await _localstorageRepository.openBox();
        _localstorageRepository.addNewstoFavorites(box, event.post);
        emit(
          FavoritesLoaded(
            Favorites(
              products: List.from(state.favorites.products)..add(event.post),
            ),
          ),
        );
      } catch (e) {
        emit(FavoritesError(e.toString()));
      }
    }
  }

  void _removeFavorites(RemoveFromFavorites event, FavoritesState state) async {
    if (state is FavoritesLoaded) {
      try {
        Box box = await _localstorageRepository.openBox();
        _localstorageRepository.removeNewsFromFavorites(box, event.post);
        emit(
          FavoritesLoaded(
            Favorites(
              products: List.from(state.favorites.products)..remove(event.post),
            ),
          ),
        );
      } catch (e) {
        emit(FavoritesError(e.toString()));
      }
    }
  }
}
