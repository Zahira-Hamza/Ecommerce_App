import 'package:e_commerce_app/domain/entities/response/auth/user.dart';

class AuthResponse {
  final String message;
  final User user;
  final String token;

  AuthResponse({
    required this.message,
    required this.user,
    required this.token,
  });
}
