import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/usecases/usecase.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:onlineshop_77/features/profile/domain/entities/user_entity.dart';
import 'package:onlineshop_77/features/profile/domain/repositories/profile_repository.dart';

class GetProfileUseCase extends UseCase<UserEntity, NoParams> {
  final ProfileRepository _repository = serviceLocator<ProfileRepositoryImpl>();

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await _repository.getUserData();
  }
}
