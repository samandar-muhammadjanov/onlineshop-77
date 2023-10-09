import 'package:onlineshop_77/core/exceptions/failures.dart';
import 'package:onlineshop_77/core/utils/either.dart';
import 'package:onlineshop_77/features/favorites/domain/entities/favorite_entity.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<FavoritesEntity>>> getMyFavorites();

  Future<Either<Failure, void>> makeFavorite(int productId);
}
