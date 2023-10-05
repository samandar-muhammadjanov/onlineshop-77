part of 'searched_text_bloc.dart';

class SearchedTextState {}

final class SearchedTextInitial extends SearchedTextState {}

class SearchedTextLoaded extends SearchedTextState {
  final String text;
  SearchedTextLoaded(this.text);
}
