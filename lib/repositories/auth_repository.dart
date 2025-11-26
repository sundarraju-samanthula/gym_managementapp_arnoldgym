
import '../api/global/auth_api_service.dart';
import '../models/auth_response_model.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final AuthApiService _apiService;

  AuthRepository(this._apiService);

  Future<AuthResponseModel> login(String idToken, String role) async {
    final response = await _apiService.loginWithGoogle(
      idToken: idToken,
      role: role,
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception(
        'Login failed: HTTP ${response.statusCode} — ${response.data}',
      );
    }

    return AuthResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<Map<String, dynamic>> fetchProfile(String userId) async {
    final response = await _apiService.getBasicProfile(userId);
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch profile: HTTP ${response.statusCode}');
    }
    return response.data as Map<String, dynamic>;
  }

  Future<void> updateProfile(
    String userId,
    Map<String, dynamic> profileData,
  ) async {
    final response = await _apiService.patchProfile(userId, profileData);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception('Failed to update profile: HTTP ${response.statusCode}');
    }
  }
}
