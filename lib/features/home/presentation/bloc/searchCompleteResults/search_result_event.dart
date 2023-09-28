part of 'search_result_bloc.dart';

sealed class SearchCompleteResultEvent extends Equatable {
  const SearchCompleteResultEvent();

  @override
  List<Object> get props => [];
}

class GetCompleteResultsEvent extends SearchCompleteResultEvent {
  final String query;
  const GetCompleteResultsEvent(this.query);
}
