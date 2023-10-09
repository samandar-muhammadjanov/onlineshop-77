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
  final FavoritesEntity favoritesEntity;

  const AddToFavorites(this.favoritesEntity);

  @override
  List<Object> get props => [favoritesEntity];
}

class RemoveToFavorites extends FavoritesEvent {
  final int productId;

  const RemoveToFavorites(this.productId);

  @override
  List<Object> get props => [productId];
}
