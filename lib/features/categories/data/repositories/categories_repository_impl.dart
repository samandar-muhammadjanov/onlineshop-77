import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/exceptions/exceptions.dart';
import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/categories/data/data_source/categories_datasource.dart';
import 'package:onlineshop_77/features/categories/domain/entities/categories_entity.dart';
import 'package:onlineshop_77/features/categories/domain/repositories/categoryies_repository.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  final CategoriesDataSource _dataSource = serviceLocator<CategoriesDataSourceImpl>();

  @override
  Future<Either<Failure, List<CategoriesEntity>>> getCategories() async {
    try {
      final result = await _dataSource.getCategories();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, errorMessage: e.errorMessage, errorKey: e.errorKey));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(DioFailure());
    }
  }
}
