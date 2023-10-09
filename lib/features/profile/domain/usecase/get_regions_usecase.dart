import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/usecases/usecase.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/home/data/repositories/home_repository_impl.dart';
import 'package:onlineshop_77/features/home/doman/entity/region_entity.dart';
import 'package:onlineshop_77/features/home/doman/repository/home_repository.dart';
import 'package:onlineshop_77/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:onlineshop_77/features/profile/domain/entities/user_entity.dart';
import 'package:onlineshop_77/features/profile/domain/repositories/profile_repository.dart';

class GetRegionsUseCase extends UseCase<List<RegionEntity>, NoParams> {
  final HomeRepository _repository = serviceLocator<HomeRepositoryImpl>();

  @override
  Future<Either<Failure, List<RegionEntity>>> call(NoParams params) async {
    return await _repository.getRegions();
  }
}
