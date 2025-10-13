import 'package:dio/dio.dart';
import 'package:e_commerce_app/api/data_sources/remote/auth/auth_remote_data_source.dart';
import 'package:e_commerce_app/api/mapper/auth/auth_response_mapper.dart';
import 'package:e_commerce_app/api/mapper/auth/signin_request_mapper.dart';
import 'package:e_commerce_app/api/mapper/auth/signup_request_mapper.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../domain/entities/request/auth/signin_request.dart';
import '../../../../domain/entities/request/auth/signup_request.dart';
import '../../../../domain/entities/response/auth/auth_response.dart';
import '../../../web_services.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final WebServices webServices;

  AuthRemoteDataSourceImpl({required this.webServices});

  @override
  Future<AuthResponse> signIn(SigninRequest request) async {
    try {
      // Convert entity to DTO
      final signinRequestDto = request.toDto();
      // SigninRequestDto signinRequestDto=SigninRequestDto(
      //   email: request.email,
      //   password: request.password,
      // );

      // Call web service with DTO
      final authResponseDto = await webServices.signIn(signinRequestDto);

      // Convert DTO response to entity
      return authResponseDto.toEntity();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }

  @override
  Future<AuthResponse> signUp(SignupRequest request) async {
    try {
      // Convert entity to DTO
      final signupRequestDto = request.toDto();

      // Call web service with DTO
      final authResponseDto = await webServices.signUp(signupRequestDto);

      // Convert DTO response to entity
      return authResponseDto.toEntity();
    } on DioException catch (e) {
      String message = (e.error as AppException).message;
      throw ServerException(message: message);
    }
  }
}
