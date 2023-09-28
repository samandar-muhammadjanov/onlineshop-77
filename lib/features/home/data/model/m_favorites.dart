import 'package:equatable/equatable.dart';

import 'm_product.dart';

class Favorites extends Equatable {
  final List<Result> products;
  const Favorites({
    this.products = const <Result>[],
  });

  @override
  List<Object?> get props => [products];
}
