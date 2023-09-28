part of 'search_result_bloc.dart';

sealed class SearchCompleteResultState extends Equatable {
  const SearchCompleteResultState();

  @override
  List<Object> get props => [];
}

final class SearchCompleteResultInitial extends SearchCompleteResultState {}

final class SearchCompleteResultLoading extends SearchCompleteResultState {}

final class SearchCompleteResultLoaded extends SearchCompleteResultState {
  final List<SearchResult> result;
  const SearchCompleteResultLoaded(this.result);
}

final class SearchCompleteResultError extends SearchCompleteResultState {
  final String error;
  const SearchCompleteResultError(this.error);
}
