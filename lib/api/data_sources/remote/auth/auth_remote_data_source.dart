import '../../../../domain/entities/request/auth/signin_request.dart';
import '../../../../domain/entities/request/auth/signup_request.dart';
import '../../../../domain/entities/response/auth/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> signIn(SigninRequest request);
  Future<AuthResponse> signUp(SignupRequest request);
}
