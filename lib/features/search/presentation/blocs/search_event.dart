part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchProductsEvent extends SearchEvent {
  final String query;

  const GetSearchProductsEvent(this.query);
}

class GetRegionsEvent extends SearchEvent {
  const GetRegionsEvent();
}
