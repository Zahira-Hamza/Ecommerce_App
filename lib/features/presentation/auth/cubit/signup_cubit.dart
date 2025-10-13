import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../domain/entities/request/auth/signup_request.dart'; // Import domain entity
import '../../../../domain/use_cases/auth/signup_use_case.dart';
import 'auth_state.dart';

@injectable
class SignupCubit extends Cubit<AuthState> {
  final SignupUseCase signupUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignupCubit({required this.signupUseCase}) : super(AuthInitial());

  void signUp({
    required String email,
    required String password,
    required String rePassword,
    required String phone,
    required String name,
  }) async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(AuthLoading());
        // Use domain entity instead of DTO
        var signupRequest = SignupRequest(
          email: email,
          password: password,
          rePassword: rePassword,
          phone: phone,
          name: name,
        );
        var response = await signupUseCase.invoke(signupRequest);
        emit(AuthLoaded(authResponse: response));
      } on AppException catch (e) {
        emit(AuthError(message: e.message));
      } on DioException catch (e) {
        final message = (e.error is AppException)
            ? (e.error as AppException).message
            : "Unexpected error occurred";
        emit(AuthError(message: message));
      }
    }
  }
}
