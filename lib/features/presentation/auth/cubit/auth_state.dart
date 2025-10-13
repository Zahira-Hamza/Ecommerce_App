import 'package:flutter/material.dart';

import '../../../../domain/entities/response/auth/auth_response.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  final String message;
  AuthError({required this.message});
}

final class AuthLoaded extends AuthState {
  final AuthResponse authResponse;
  AuthLoaded({required this.authResponse});
}
