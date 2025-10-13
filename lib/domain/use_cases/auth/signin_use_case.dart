import 'package:e_commerce_app/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../entities/request/auth/signin_request.dart';
import '../../entities/response/auth/auth_response.dart';

@injectable
class SigninUseCase {
  final AuthRepository authRepository;

  SigninUseCase({required this.authRepository});

  Future<AuthResponse> invoke(SigninRequest request) {
    return authRepository.signIn(request);
  }
}
