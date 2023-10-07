import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/usecases/usecase.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:onlineshop_77/features/categories/domain/entities/categories_entity.dart';
import 'package:onlineshop_77/features/categories/domain/repositories/categoryies_repository.dart';

class GetCategoriesUseCase extends UseCase<List<CategoriesEntity>, NoParams> {
  final CategoriesRepository _repository = serviceLocator<CategoriesRepositoryImpl>();

  @override
  Future<Either<Failure, List<CategoriesEntity>>> call(NoParams params) async {
    return await _repository.getCategories();
  }
}
