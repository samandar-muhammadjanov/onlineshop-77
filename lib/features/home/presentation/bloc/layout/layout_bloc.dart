import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'layout_event.dart';
part 'layout_state.dart';

class LayoutBloc extends Bloc<LayoutEvent, LayoutState> {
  LayoutBloc() : super(const LayoutInitial(isVertical: false)) {
    on<VerticalOnEvent>((event, emit) {
      emit(const LayoutState(true));
    });
    on<VerticalOffEvent>((event, emit) {
      emit(const LayoutState(false));
    });
  }
}
