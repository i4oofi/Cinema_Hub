import 'package:dio/dio.dart';

class Api {
  final Dio _dio = Dio();
  static const String _apiKey = 'aa99a5b22353c8bf4cc96417e8c44dbb';

  Api(Dio dio) {
    _dio.options.baseUrl = 'https://api.themoviedb.org/3/';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 3);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.queryParameters['aa99a5b22353c8bf4cc96417e8c44dbb'] = _apiKey;
        return handler.next(options);
      },
    ));
  }

  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    if (e.response != null) {
      throw Exception(
          'API Error: ${e.response?.statusCode} - ${e.response?.statusMessage}');
    } else {
      throw Exception('Network Error: ${e.message}');
    }
  }
}
