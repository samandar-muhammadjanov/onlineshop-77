part of 'layout_bloc.dart';

class LayoutState extends Equatable {
  final bool isVertical;
  const LayoutState(this.isVertical);

  @override
  List<Object?> get props => [isVertical];
}

class LayoutInitial extends LayoutState {
  const LayoutInitial({required bool isVertical}) : super(isVertical);
}
