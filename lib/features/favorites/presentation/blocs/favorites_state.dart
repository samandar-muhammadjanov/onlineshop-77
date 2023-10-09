part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final FormzSubmissionStatus status;
  final List<FavoritesEntity> favoriteList;

  const FavoritesState({
    this.status = FormzSubmissionStatus.initial,
    this.favoriteList = const [],
  });

  FavoritesState copyWith({
    FormzSubmissionStatus? status,
    List<FavoritesEntity>? favoriteList,
  }) =>
      FavoritesState(
        status: status ?? this.status,
        favoriteList: favoriteList ?? this.favoriteList,
      );

  @override
  List<Object> get props => [
        status,
        favoriteList,
      ];
}
