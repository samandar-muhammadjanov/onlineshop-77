part of 'favorites_bloc.dart';

sealed class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class StartFavorites extends FavoritesEvent {
  @override
  List<Object> get props => [];
}

class AddToFavorites extends FavoritesEvent {
  final Result post;
  const AddToFavorites(this.post);
  @override
  List<Object> get props => [post];
}

class RemoveFromFavorites extends FavoritesEvent {
  final Result post;
  const RemoveFromFavorites(this.post);
  @override
  List<Object> get props => [post];
}
