import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/api/dio_settings.dart';
import 'package:onlineshop_77/core/exceptions/custom_exception.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/features/categories/data/models/caregories_model.dart';

abstract class CategoriesDataSource {
  Future<List<CategoriesModel>> getCategories();
}

class CategoriesDataSourceImpl extends CategoriesDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;

  @override
  Future<List<CategoriesModel>> getCategories() async {
    try {
      final response = await _dio.get('/store/categories-with-childs/');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data as List).map((e) => CategoriesModel.fromJson(e as Map<String, dynamic>)).toList();
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
