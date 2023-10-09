import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/exceptions/exceptions.dart';
import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/home/data/data_source/home_datasource.dart';
import 'package:onlineshop_77/features/home/doman/entity/region_entity.dart';
import 'package:onlineshop_77/features/home/doman/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _dataSource = serviceLocator<HomeDataSourceImpl>();

  @override
  Future<Either<Failure, List<RegionEntity>>> getRegions() async {
    try {
      final result = await _dataSource.getRegions();
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
