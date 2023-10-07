import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/core/utils/params.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> registration(AuthParams params);

  Future<Either<Failure, void>> login(LoginParams params);
}
