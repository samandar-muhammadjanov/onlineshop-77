import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/usecases/usecase.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/favorites/data/repositories/favorite_repository_impl.dart';
import 'package:onlineshop_77/features/favorites/domain/entities/favorite_entity.dart';
import 'package:onlineshop_77/features/favorites/domain/repositories/favorite_repository.dart';

class MakeFavoriteUseCase extends UseCase<void, int> {
  final FavoriteRepository _repository = serviceLocator<FavoriteRepositoryImpl>();

  @override
  Future<Either<Failure, void>> call(int params) async {
    return await _repository.makeFavorite(params);
  }
}
