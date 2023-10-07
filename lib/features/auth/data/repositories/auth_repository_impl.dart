import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/exceptions/exceptions.dart';
import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/core/utils/params.dart';
import 'package:onlineshop_77/features/auth/data/datasource/auth_datasource.dart';
import 'package:onlineshop_77/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource = serviceLocator<AuthDataSourceImpl>();

  @override
  Future<Either<Failure, void>> login(LoginParams params) async {
    try {
      final result = await _dataSource.login(params);
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
  Future<Either<Failure, void>> registration(AuthParams params) async {
    try {
      final result = await _dataSource.registration(params);
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
