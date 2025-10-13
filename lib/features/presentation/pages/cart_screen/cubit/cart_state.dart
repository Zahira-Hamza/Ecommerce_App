// part of 'cart_cubit.dart';
//
// @immutable
// sealed class CartState {}
//
// final class CartInitial extends CartState {}
//
// final class CartLoading extends CartState {}
//
// final class CartError extends CartState {
//   final String message;
//   CartError({required this.message});
// }
//
// final class CartLoaded extends CartState {
//   int numOfCartItems;
//   CartLoaded({required this.numOfCartItems});
// }
//
// sealed class UserCartState {}
//
// final class UserCartInitial extends CartState {}
//
// final class UserCartLoading extends CartState {}
//
// final class UserCartError extends CartState {
//   final String message;
//   UserCartError({required this.message});
// }
//
// final class UserCartLoaded extends CartState {
//   UserCartResponse userCartResponse;
//   UserCartLoaded({required this.userCartResponse});
// }
// cart_state.dart - FIXED
part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartError extends CartState {
  final String message;
  CartError({required this.message});
}

final class CartLoaded extends CartState {
  final int numOfCartItems;
  CartLoaded({required this.numOfCartItems});
}

final class UserCartLoading extends CartState {}

final class UserCartError extends CartState {
  final String message;
  UserCartError({required this.message});
}

final class UserCartLoaded extends CartState {
  final UserCartResponse userCartResponse;
  UserCartLoaded({required this.userCartResponse});
}
