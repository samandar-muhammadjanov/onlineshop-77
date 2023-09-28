part of 'favorites_bloc.dart';

sealed class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

final class FavoritesInitial extends FavoritesState {}

final class FavoritesLoading extends FavoritesState {}

final class FavoritesLoaded extends FavoritesState {
  final Favorites favorites;
  const FavoritesLoaded(this.favorites);
  @override
  List<Object> get props => [favorites];
}

final class FavoritesError extends FavoritesState {
  final String error;
  const FavoritesError(this.error);

  @override
  List<Object> get props => [error];
}
