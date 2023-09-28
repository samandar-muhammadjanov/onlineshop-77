import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthinticatedEvent>((event, emit) {
      try {
        emit(AuthLoaded(event.isAuth));
      } catch (e) {
        emit(
          AuthError(
            e.toString(),
          ),
        );
      }
    });
  }
}
