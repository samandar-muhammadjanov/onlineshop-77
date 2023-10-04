part of 'saerchsys_bloc.dart';

class SearchsysEvent {}

class OnSearchInitialEvent extends SearchsysEvent {}

class OnSearchChangeEvent extends SearchsysEvent {}

class OnSearchResultEvent extends SearchsysEvent {}

class OnPopularSearchEvent extends SearchsysEvent {
  final String query;
  OnPopularSearchEvent(this.query);
}
