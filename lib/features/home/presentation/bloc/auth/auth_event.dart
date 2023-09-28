part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthinticatedEvent extends AuthEvent {
  final bool isAuth;
  AuthinticatedEvent(this.isAuth);
}
