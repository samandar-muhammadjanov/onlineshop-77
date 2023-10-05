part of 'searched_text_bloc.dart';

class SearchedTextEvent {}

class OnSearch extends SearchedTextEvent {
  final String text;
  OnSearch(this.text);
}
