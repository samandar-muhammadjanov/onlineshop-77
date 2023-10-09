part of 'user_bloc.dart';

class UserState extends Equatable {
  final FormzSubmissionStatus status;
  final UserEntity userEntity;

  const UserState({
    this.status = FormzSubmissionStatus.initial,
    this.userEntity = const UserEntity(),
  });

  UserState copyWith({
    FormzSubmissionStatus? status,
    UserEntity? userEntity,
  }) =>
      UserState(
        status: status ?? this.status,
        userEntity: userEntity ?? this.userEntity,
      );

  @override
  List<Object?> get props => [
        status,
        userEntity,
      ];
}
