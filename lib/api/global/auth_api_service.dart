
import 'package:dio/dio.dart';

class AuthApiService {
  final Dio _dio;

  AuthApiService(this._dio);

  Future<Response> loginWithGoogle({
    required String idToken,
    required String role,
  }) async {
    return _dio.post(
      '/auth/google/android',
      data: {'idToken': idToken, 'role': role},
    );
  }

  Future<Response> getBasicProfile(String userId) async {
    return _dio.get('/manager/getBasicProfile/$userId');
  }

  Future<Response> patchProfile(
    String userId,
    Map<String, dynamic> body,
  ) async {
    return _dio.patch('/manager/createManagerProfile/$userId', data: body);
  }
}
