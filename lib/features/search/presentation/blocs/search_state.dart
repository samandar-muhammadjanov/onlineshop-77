part of 'search_bloc.dart';

class SearchState extends Equatable {
  final FormzSubmissionStatus status;

  const SearchState({
    this.status = FormzSubmissionStatus.initial,
  });

  SearchState copyWith({FormzSubmissionStatus? status}) => SearchState(
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [];
}
