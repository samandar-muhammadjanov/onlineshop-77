part of 'popular_searchs_bloc.dart';

class PopularSearchsState {}

class PopularSearchsInitial extends PopularSearchsState {}

class PopularSearchsLoading extends PopularSearchsState {}

class PopularSearchsLoaded extends PopularSearchsState {
  final List<PopularSearchs> popularSearchs;
  PopularSearchsLoaded(this.popularSearchs);
}

class PopularSearchsError extends PopularSearchsState {
  final String error;
  PopularSearchsError(this.error);
}
