import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/api/dio_settings.dart';
import 'package:onlineshop_77/core/exceptions/custom_exception.dart';
import 'package:onlineshop_77/core/pagination/generic_pagination_model.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/storage/store_keys.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/features/create_ads/data/models/ads_model.dart';
import 'package:onlineshop_77/features/home/data/model/popular_search_model.dart';
import 'package:onlineshop_77/features/home/data/model/region_model.dart';
import 'package:onlineshop_77/features/home/data/model/search_result_model.dart';

abstract class HomeDataSource {
  Future<GenericPagination<AdsModel>> getProducts();

  Future<List<PopularSearchModel>> getPopularSearch();

  Future<List<SearchResultModel>> searchComplete(String query);

  Future<AdsModel> getProductDetail(String slug);

  Future<List<RegionModel>> getRegions();
}

class HomeDataSourceImpl implements HomeDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;

  @override
  Future<GenericPagination<AdsModel>> getProducts() async {
    try {
      final response = await _dio.get(
        '/store/list/ads/',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final result = GenericPagination.fromJson(response.data, (e) => AdsModel.fromJson(e as Map<String, dynamic>));
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

  @override
  Future<List<PopularSearchModel>> getPopularSearch() async {
    try {
      final response = await _dio.get('/store/search/populars/');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final result = (response.data as List).map((e) => PopularSearchModel.fromJson(e)).toList();
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

  @override
  Future<List<SearchResultModel>> searchComplete(String query) async {
    try {
      final response = await _dio.get(
        '/store/search/complete/?q=$query',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final result =
            (response.data as List).map((e) => SearchResultModel.fromJson(e as Map<String, dynamic>)).toList();
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

  @override
  Future<AdsModel> getProductDetail(String slug) async {
    try {
      final response = await _dio.get(
        '/store/ads/$slug/',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final result = AdsModel.fromJson(response.data);
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

  Future<List<AdsModel>> getMyProducts() async {
    try {
      final token = StorageRepository.getString(StoreKeys.token);
      final response = await _dio.get(
        '/store/my-ads/',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final result = (response.data as List).map((e) => AdsModel.fromJson(e as Map<String, dynamic>)).toList();
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

  @override
  Future<List<RegionModel>> getRegions() async {
    try {
      final response = await _dio.get(
        '/common/regions-with-districts/',
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final result = (response.data as List).map((e) => RegionModel.fromJson(e as Map<String, dynamic>)).toList();
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
