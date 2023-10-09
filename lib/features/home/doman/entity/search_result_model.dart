import 'package:equatable/equatable.dart';

class SearchResultEntity extends Equatable {
  final String name;

  const SearchResultEntity({
    this.name = '',
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
