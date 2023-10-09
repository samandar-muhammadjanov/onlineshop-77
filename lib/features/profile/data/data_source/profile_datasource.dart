import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/api/dio_settings.dart';
import 'package:onlineshop_77/core/exceptions/custom_exception.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/core/storage/store_keys.dart';
import 'package:onlineshop_77/features/profile/data/models/user_model.dart';

abstract class ProfileDataSource {
  Future<UserModel> getUserData();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;

  @override
  Future<UserModel> getUserData() async {
    try {
      final token = StorageRepository.getString(StoreKeys.token);
      final response = await _dio.get(
        '/accounts/me/',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final result = UserModel.fromJson(response.data);
        return result;
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
    } on CustomException {
      rethrow;
    } on Exception catch (error) {
      throw CustomException(message: '$error', code: '141');
    }
  }
}
