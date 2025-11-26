
class AuthResponseModel {
  final String token;
  final String userID;
  final String role;

  AuthResponseModel({
    required this.token,
    required this.userID,
    required this.role,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    final token = json['token'] as String?;
    final userID = json['userID'] as String?;
    final role = json['role'] as String?;

    if (token == null || userID == null || role == null) {
      throw Exception('Invalid auth response - missing required fields');
    }

    return AuthResponseModel(token: token, userID: userID, role: role);
  }
}
