import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/api/dio_settings.dart';
import 'package:onlineshop_77/core/exceptions/custom_exception.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/utils/params.dart';

abstract class AuthDataSource {
  Future<void> registration(AuthParams params);

  Future<void> login(LoginParams loginParams);
}

class AuthDataSourceImpl implements AuthDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;

  @override
  Future<void> registration(AuthParams params) async {
    try {
      final response = await _dio.post('/accounts/seller/registration/');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        final message = (response.data as Map<String, dynamic>).values.first.toString().replaceAll(
              RegExp(r'[\[\]]'),
              '',
            );
        throw CustomException(
          message: message,
          code: '${response.statusCode}',
        );
      }
    } on DioException catch (error) {
      throw DioException(requestOptions: error.requestOptions);
      // throw MyFunctions.getDioExceptionAsString(error: error);
    } on CustomException {
      rethrow;
    } on Exception catch (error) {
      throw CustomException(message: '$error', code: '141');
    }
  }

  @override
  Future<void> login(LoginParams loginParams) async {
    try {
      final data = {
        "phone_number": loginParams.login,
        "password": loginParams.password,
      };
      final response = await _dio.post(
        '/accounts/login/',
        data: data,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        //   StorageRepository.putBool(key: StoreKeys.isFirstTime, value: true);
        //   StorageRepository.putString(StoreKeys.token, body["access_token"]);
        //   StorageRepository.putString(StoreKeys.refresh, body["refresh_token"]);
        return;
      } else {
        final message = (response.data as Map<String, dynamic>).values.first.toString().replaceAll(
              RegExp(r'[\[\]]'),
              '',
            );
        throw CustomException(
          message: message,
          code: '${response.statusCode}',
        );
      }
    } on DioException catch (error) {
      throw DioException(requestOptions: error.requestOptions);
      // throw MyFunctions.getDioExceptionAsString(error: error);
    } on CustomException {
      rethrow;
    } on Exception catch (error) {
      throw CustomException(message: '$error', code: '141');
    }
  }
}
