import 'package:e_commerce_app/api/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/repositories/auth/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/request/auth/signin_request.dart';
import '../../../domain/entities/request/auth/signup_request.dart';
import '../../../domain/entities/response/auth/auth_response.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<AuthResponse> signIn(SigninRequest signinRequest) async {
    return await remoteDataSource.signIn(signinRequest);
  }

  @override
  Future<AuthResponse> signUp(SignupRequest signupRequest) async {
    return await remoteDataSource.signUp(signupRequest);
  }
}
