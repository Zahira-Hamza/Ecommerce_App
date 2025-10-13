import '../../entities/request/auth/signin_request.dart';
import '../../entities/request/auth/signup_request.dart';
import '../../entities/response/auth/auth_response.dart';

abstract class AuthRepository {
  Future<AuthResponse> signIn(SigninRequest request);
  Future<AuthResponse> signUp(SignupRequest request);
}
