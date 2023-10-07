import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<GetUserDataEvent>((event, emit) async {
      // try {
      //   emit(UserLoading());
      //   final userData = await HomeRepository().getUserData();
      //   emit(UserLoaded(userData));
      // } catch (e) {
      //   emit(UserError(e.toString()));
      // }
    });
  }
}
