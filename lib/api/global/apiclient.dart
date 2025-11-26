import 'package:arnoldgym/shared/utils/storage_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  final Dio dio;

  ApiClient._internal(this.dio);

  factory ApiClient() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://arnoldbackend.onrender.com',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 50),
        headers: {
          'X-Device-Platform': 'android',
          'Content-Type': 'application/json',
        },

        validateStatus: (status) {
          //500 responses to reach
          return status != null && status < 600;
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await StorageUtil.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response != null) {
            final status = error.response!.statusCode;
            final data = error.response!.data;

            debugPrint('Dio Error -> Status: $status, Data: $data');

            String errorMessage;
            switch (status) {
              case 500:
                errorMessage = 'Server error. Please try again later.';
                break;
              case 401:
                errorMessage = 'Unauthorized. Please login again.';
                break;
              case 404:
                errorMessage = 'Resource not found.';
                break;
              default:
                errorMessage = 'Unexpected error (code: $status)';
            }

            //  throw a custom exception
            return handler.reject(
              DioException(
                requestOptions: error.requestOptions,
                error: errorMessage,
              ),
            );
          }

          // network issue etc.
          return handler.next(error);
        },
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(request: true, requestBody: true, responseBody: true),
      );
    }

    return ApiClient._internal(dio);
  }
}
