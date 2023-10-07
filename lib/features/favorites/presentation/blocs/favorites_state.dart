part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  final FormzSubmissionStatus status;

  const FavoritesState({
    this.status = FormzSubmissionStatus.initial,
  });

  FavoritesState copyWith({
    FormzSubmissionStatus? status,
  }) =>
      FavoritesState(
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [
        status,
      ];
}
