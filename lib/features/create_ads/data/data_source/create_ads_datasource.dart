import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/api/dio_settings.dart';
import 'package:onlineshop_77/core/exceptions/custom_exception.dart';
import 'package:onlineshop_77/core/singleton/singleton.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';
import 'package:onlineshop_77/core/storage/store_keys.dart';
import 'package:onlineshop_77/core/utils/params.dart';

abstract class CreateAdsDataSource {
  Future<void> createNewAds(AdsParams params);
}

class CreateAdsDataSourceImpl implements CreateAdsDataSource {
  final Dio _dio = serviceLocator<DioSettings>().dio;

  @override
  Future<void> createNewAds(AdsParams params) async {
    try {
      final token = StorageRepository.getString(StoreKeys.token);

      Map<String, dynamic> data = {};
      List<dynamic> photos = [];

      data.addAll({'name': params.name});
      data.addAll({'category': params.category});
      data.addAll({'description': params.description});
      data.addAll({'price': params.price});
      data.addAll({'currency': params.currency});

      if (params.imgList.isNotEmpty) {
        params.imgList.forEach((element) async {
          photos.add(await MultipartFile.fromFile(
            element,
            filename: element.split('/').last,
          ));
        });
        data.addAll({'photos': photos});
      }

      final fData = FormData.fromMap(data);

      final response = await _dio.post('/store/ads/',
          options: Options(
            headers: {'Authorization': token},
          ),
          data: fData);
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
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
