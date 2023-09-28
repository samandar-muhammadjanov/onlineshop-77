part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoaded extends AuthState {
  final bool isAuthinticated;
  AuthLoaded(this.isAuthinticated);
}

final class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}
