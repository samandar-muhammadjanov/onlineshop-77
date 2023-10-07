part of 'auth_bloc.dart';

@immutable
class AuthState extends Equatable {
  final FormzSubmissionStatus registerStatus;
  final FormzSubmissionStatus loginStatus;

  AuthState({
    this.registerStatus = FormzSubmissionStatus.initial,
    this.loginStatus = FormzSubmissionStatus.initial,
  });

  AuthState copyWith({
    FormzSubmissionStatus? registerStatus,
    FormzSubmissionStatus? loginStatus,
  }) =>
      AuthState(
        registerStatus: registerStatus ?? this.registerStatus,
        loginStatus: loginStatus ?? this.loginStatus,
      );

  @override
  List<Object?> get props => [
        registerStatus,
        loginStatus,
      ];
}
