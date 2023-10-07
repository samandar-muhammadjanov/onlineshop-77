import 'package:dio/dio.dart';
import 'package:onlineshop_77/core/storage/storage_repository.dart';

class TokenRefreshInterceptor implements Interceptor {
  final Dio dio;
  final String baseUrl;

  const TokenRefreshInterceptor({
    required this.dio,
    required this.baseUrl,
  });

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.badResponse &&
        (err.response?.statusCode == 403 || err.response?.statusCode == 401)) {
      await StorageRepository.deleteString('token');
      await _refreshToken(err.requestOptions.baseUrl);
      if (StorageRepository.getString('token').replaceAll('Bearer', '').trim().isNotEmpty) {
        err.requestOptions.headers['Authorization'] = StorageRepository.getString('token');
      }
      final response = await _resolveResponse(err.requestOptions);
      handler.resolve(response);
      return;
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 403 || response.statusCode == 401) {
      if (StorageRepository.getString('refresh').isEmpty) {
        handler.next(response);
        return;
      }
      await _refreshToken(response.requestOptions.baseUrl);
      if (StorageRepository.getString('token').replaceAll('Bearer', '').trim().isNotEmpty) {
        response.requestOptions.headers['Authorization'] = StorageRepository.getString('token');
      }
      final resolved = await _resolveResponse(response.requestOptions);
      handler.resolve(resolved);
      return;
    }
    handler.next(response);
  }

  Future<void> _refreshToken(String baseUrl) async {
    if (StorageRepository.getString('refresh').isNotEmpty) {
      final response =
          await dio.post('${baseUrl}auth/token/refresh/', data: {'refresh': StorageRepository.getString('refresh')});
      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        await StorageRepository.putString('token', 'Bearer ${response.data['access']}');
      } else {
        await StorageRepository.deleteString('refresh');
      }
    }
  }

  Future<Response<dynamic>> _resolveResponse(RequestOptions options) async {
    try {
      final path = options.path.replaceAll(baseUrl, '');
      if (options.data is FormData) {
        final formData = FormData();
        final fields = options.data.fields as List<MapEntry<String, String>>;
        formData.fields.addAll(fields);
        for (final MapEntry mapFile in options.data.files) {
          formData.files.add(MapEntry(
              mapFile.key,
              MultipartFile.fromFileSync(
                  fields
                      .firstWhere((element) => element.key == 'photo_path', orElse: () => const MapEntry('', ''))
                      .value,
                  filename: mapFile.value.filename)));
        }
        options.data = formData;
      }
      return await dio.request(baseUrl + path,
          data: options.data,
          queryParameters: options.queryParameters,
          options: Options(
            headers: options.headers,
            method: options.method,
          ));
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
