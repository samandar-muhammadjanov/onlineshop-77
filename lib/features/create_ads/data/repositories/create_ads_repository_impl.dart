import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/exceptions/exceptions.dart';
import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/core/utils/params.dart';
import 'package:onlineshop_77/features/create_ads/data/data_source/create_ads_datasource.dart';
import 'package:onlineshop_77/features/create_ads/domain/repositories/create_ads_repository.dart';

class CreateAdsRepositoryImpl implements CreateAdsRepository {
  final CreateAdsDataSource _dataSource = serviceLocator<CreateAdsDataSourceImpl>();

  @override
  Future<Either<Failure, void>> createNewAds(AdsParams params) async {
    try {
      final result = await _dataSource.createNewAds(params);
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
