import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/usecases/usecase.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/core/utils/params.dart';
import 'package:onlineshop_77/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:onlineshop_77/features/auth/domain/repository/auth_repository.dart';

class RegistrationUseCase extends UseCase<void, AuthParams> {
  final AuthRepository _repository = serviceLocator<AuthRepositoryImpl>();

  @override
  Future<Either<Failure, void>> call(AuthParams params) async {
    return await _repository.registration(params);
  }
}
