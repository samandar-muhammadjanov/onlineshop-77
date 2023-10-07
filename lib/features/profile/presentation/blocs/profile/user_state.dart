part of 'user_bloc.dart';

class UserState extends Equatable {
  final FormzSubmissionStatus status;

  const UserState({
    this.status = FormzSubmissionStatus.initial,
  });

  UserState copyWith({FormzSubmissionStatus? status}) => UserState(status: status ?? this.status);

  @override
  List<Object?> get props => [
        status,
      ];
}
