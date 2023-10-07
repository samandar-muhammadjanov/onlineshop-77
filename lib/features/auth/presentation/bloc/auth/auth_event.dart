part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthenticatedEvent extends AuthEvent {
  final String fullName;
  final String projectName;
  final int categoryId;
  final String phoneNumber;
  final String address;

  AuthenticatedEvent({
    required this.fullName,
    required this.projectName,
    required this.categoryId,
    required this.phoneNumber,
    required this.address,
  });
}

class LoginEvent extends AuthEvent {
  final String login;
  final String password;

  LoginEvent({
    required this.login,
    required this.password,
  });
}
