part of 'search_onchanged_bloc.dart';

class SearchOnchangedState extends Equatable {
  final bool isChanged;
  const SearchOnchangedState(this.isChanged);

  @override
  List<Object> get props => [isChanged];
}

final class SearchOnchangedInitial extends SearchOnchangedState {
  const SearchOnchangedInitial({required bool isChanged}) : super(isChanged);
}
