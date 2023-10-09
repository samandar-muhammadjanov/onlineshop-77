import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/exceptions/exceptions.dart';
import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/favorites/data/datasource/favorite_datasource.dart';
import 'package:onlineshop_77/features/favorites/domain/entities/favorite_entity.dart';
import 'package:onlineshop_77/features/favorites/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteDataSource _dataSource = serviceLocator<FavoriteDataSourceImpl>();

  @override
  Future<Either<Failure, List<FavoritesEntity>>> getMyFavorites() async {
    try {
      final result = await _dataSource.getMyFavorites();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, errorMessage: e.errorMessage, errorKey: e.errorKey));
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on DioException catch (e) {
      return Left(DioFailure());
    }
  }

  @override
  Future<Either<Failure, void>> makeFavorite(int productId) async {
    try {
      final result = await _dataSource.makeFavorite(productId);
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
