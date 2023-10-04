part of 'regions_bloc.dart';

class RegionsState {}

class RegionsInitial extends RegionsState {}

class RegionsLoading extends RegionsState {}

class RegionsLoaded extends RegionsState {
  final List<Regions> regions;
  RegionsLoaded(this.regions);
}

class RegionsError extends RegionsState {
  final String error;
  RegionsError(this.error);
}
