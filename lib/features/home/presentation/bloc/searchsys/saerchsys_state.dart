part of 'saerchsys_bloc.dart';

class SearchsysState {}

final class SaerchsysInitial extends SearchsysState {}

class OnSearchChange extends SearchsysState {}

class OnSearchInitial extends SearchsysState {}

class OnSearchResult extends SearchsysState {}

class OnPopularSearch extends SearchsysState {
  final String query;
  OnPopularSearch(this.query);
}
