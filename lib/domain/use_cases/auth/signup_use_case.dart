import 'package:e_commerce_app/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/request/auth/signup_request.dart';
import '../../entities/response/auth/auth_response.dart';

@injectable
class SignupUseCase {
  final AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  Future<AuthResponse> invoke(SignupRequest request) {
    return authRepository.signUp(request);
  }
}
