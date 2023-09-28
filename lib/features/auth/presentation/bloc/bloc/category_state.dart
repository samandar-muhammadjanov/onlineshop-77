part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final String name;
  final int id;
  const CategoryState(this.name, this.id);

  @override
  List<Object> get props => [name, id];
}

final class CategoryInitial extends CategoryState {
  const CategoryInitial(super.name, super.id);
}
