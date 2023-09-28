part of 'search_onchanged_bloc.dart';

class SearchOnchangedEvent extends Equatable {
  const SearchOnchangedEvent();

  @override
  List<Object> get props => [];
}

class OnchangeEvent extends SearchOnchangedEvent {}

class OnUnchangeEvent extends SearchOnchangedEvent {}
