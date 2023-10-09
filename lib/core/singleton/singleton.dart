import 'package:get_it/get_it.dart';
import 'package:onlineshop_77/core/api/dio_settings.dart';
import 'package:onlineshop_77/features/auth/data/datasource/auth_datasource.dart';
import 'package:onlineshop_77/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:onlineshop_77/features/categories/data/data_source/categories_datasource.dart';
import 'package:onlineshop_77/features/categories/data/repositories/categories_repository_impl.dart';
import 'package:onlineshop_77/features/create_ads/data/data_source/create_ads_datasource.dart';
import 'package:onlineshop_77/features/favorites/data/datasource/favorite_datasource.dart';
import 'package:onlineshop_77/features/favorites/data/repositories/favorite_repository_impl.dart';
import 'package:onlineshop_77/features/home/data/data_source/home_datasource.dart';
import 'package:onlineshop_77/features/home/data/repositories/home_repository_impl.dart';
import 'package:onlineshop_77/features/profile/data/data_source/profile_datasource.dart';
import 'package:onlineshop_77/features/search/data/data_source/search_datasource.dart';
import 'package:onlineshop_77/features/search/data/repositories/search_repository_impl.dart';

import '../../features/profile/data/repositories/profile_repository_impl.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton(() => DioSettings());

  serviceLocator.registerLazySingleton(() => AuthDataSourceImpl());

  serviceLocator.registerLazySingleton(() => AuthRepositoryImpl());

  serviceLocator.registerLazySingleton(() => CategoriesDataSourceImpl());

  serviceLocator.registerLazySingleton(() => CategoriesRepositoryImpl());

  serviceLocator.registerLazySingleton(() => CreateAdsDataSourceImpl());

  serviceLocator.registerLazySingleton(() => SearchDataSourceImpl());

  serviceLocator.registerLazySingleton(() => SearchRepositoryImpl());

  serviceLocator.registerLazySingleton(() => ProfileDataSourceImpl());

  serviceLocator.registerLazySingleton(() => ProfileRepositoryImpl());

  serviceLocator.registerLazySingleton(() => FavoriteDataSourceImpl());

  serviceLocator.registerLazySingleton(() => FavoriteRepositoryImpl());

  serviceLocator.registerLazySingleton(() => HomeDataSourceImpl());

  serviceLocator.registerLazySingleton(() => HomeRepositoryImpl());
}
