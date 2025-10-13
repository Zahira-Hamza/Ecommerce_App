import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/domain/use_cases/auth/signin_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/app_exception.dart';
import '../../../../domain/entities/request/auth/signin_request.dart'; // Import domain entity
import 'auth_state.dart';

@injectable
class SigninCubit extends Cubit<AuthState> {
  final SigninUseCase signinUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SigninCubit({required this.signinUseCase}) : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(AuthLoading());
        // Use domain entity instead of DTO
        var signinRequest = SigninRequest(email: email, password: password);
        var response = await signinUseCase.invoke(signinRequest);
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
