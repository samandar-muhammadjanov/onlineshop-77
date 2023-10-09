import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/api/dio_settings.dart';
import 'package:onlineshop_77/core/exceptions/custom_exception.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/core/storage/store_keys.dart';
import 'package:onlineshop_77/features/favorites/data/models/favorite_model.dart';

abstract class FavoriteDataSource {
  Future<List<FavoritesModel>> getMyFavorites();

  Future<void> makeFavorite(int productId);
}

class FavoriteDataSourceImpl implements FavoriteDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;

  @override
  Future<List<FavoritesModel>> getMyFavorites() async {
    try {
      final response = await _dio.get('/store/my-favourite-product/');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data as List).map((e) => FavoritesModel.fromJson(e as Map<String, dynamic>)).toList();
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

  @override
  Future<void> makeFavorite(int productId) async {
    try {
      final token = StorageRepository.getString(StoreKeys.token);
      final data = {
        'product': productId,
      };
      final response = await _dio.post(
        '/store/favourite-product-create/',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: data,
      );
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
    } on CustomException {
      rethrow;
    } on Exception catch (error) {
      throw CustomException(message: '$error', code: '141');
    }
  }
}
