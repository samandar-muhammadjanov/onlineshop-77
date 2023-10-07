import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/categories/domain/entities/categories_entity.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<CategoriesEntity>>> getCategories();
}
