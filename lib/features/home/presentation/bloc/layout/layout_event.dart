part of 'layout_bloc.dart';

abstract class LayoutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class VerticalOnEvent extends LayoutEvent {}

class VerticalOffEvent extends LayoutEvent {}
