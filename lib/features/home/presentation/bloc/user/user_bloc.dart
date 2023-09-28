import 'package:bloc/bloc.dart';
import 'package:onlineshop_77/features/home/data/repositories/data_repository.dart';

import '../../../data/model/m_user_data.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserDataEvent>((event, emit) async {
      try {
        emit(UserLoading());
        final userData = await HomeRepository().getUserData();
        emit(UserLoaded(userData));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
