import 'package:equatable/equatable.dart';

class PopularSearchEntity extends Equatable {
  final String search_term;
  final int search_count;

  const PopularSearchEntity({
    this.search_term = '',
    this.search_count = 0,
  });

  @override
  List<Object?> get props => [
        search_term,
        search_count,
      ];
}
