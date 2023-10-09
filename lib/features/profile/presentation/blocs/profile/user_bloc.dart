import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:onlineshop_77/core/usecases/usecase.dart';
import 'package:onlineshop_77/features/profile/domain/entities/user_entity.dart';
import 'package:onlineshop_77/features/profile/domain/usecase/get_profile_usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetProfileUseCase _getProfileUseCase = GetProfileUseCase();

  UserBloc() : super(const UserState()) {
    on<GetUserDataEvent>((event, emit) async {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      final result = await _getProfileUseCase(NoParams());
      if (result.isRight) {
        emit(state.copyWith(
          userEntity: result.right,
          status: FormzSubmissionStatus.success,
        ));
      } else {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
