import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/api/dio_settings.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';

abstract class ProfileDataSource {}

class ProfileDataSourceImpl implements ProfileDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;



}
