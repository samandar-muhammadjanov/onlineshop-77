part of 'search_bloc.dart';

class SearchState extends Equatable {
  final FormzSubmissionStatus status;
  final List<RegionEntity> regionEntity;

  const SearchState({
    this.status = FormzSubmissionStatus.initial,
    this.regionEntity = const [],
  });

  SearchState copyWith({
    FormzSubmissionStatus? status,
    List<RegionEntity>? regionEntity,
  }) =>
      SearchState(
        status: status ?? this.status,
        regionEntity: regionEntity ?? this.regionEntity,
      );

  @override
  List<Object> get props => [
        status,
        regionEntity,
      ];
}
