import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/usecases/usecase.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/core/utils/params.dart';
import 'package:onlineshop_77/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:onlineshop_77/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase extends UseCase<void, LoginParams> {
  final AuthRepository _repository = serviceLocator<AuthRepositoryImpl>();

  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    return await _repository.login(params);
  }
}
