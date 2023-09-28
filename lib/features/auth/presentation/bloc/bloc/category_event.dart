part of 'category_bloc.dart';

class CategoryEvent extends Equatable {
  final String name;
  final int id;
  const CategoryEvent(this.name, this.id);

  @override
  List<Object> get props => [name, id];
}
