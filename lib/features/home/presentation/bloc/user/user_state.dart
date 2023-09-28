part of 'user_bloc.dart';

class UserState {}

final class UserInitial extends UserState {}

final class UserLoaded extends UserState {
  final UserData userData;
  UserLoaded(this.userData);
}

final class UserLoading extends UserState {}

final class UserError extends UserState {
  final String error;
  UserError(this.error);
}
