import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/features/favorites/data/datasource/favorite_datasource.dart';
import 'package:onlineshop_77/features/favorites/domain/repositories/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {

  final FavoriteDataSource _dataSource = serviceLocator<FavoriteDataSourceImpl>();

}
