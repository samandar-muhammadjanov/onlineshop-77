import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/api/dio_settings.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';

abstract class FavoriteDataSource {}

class FavoriteDataSourceImpl implements FavoriteDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;


}
