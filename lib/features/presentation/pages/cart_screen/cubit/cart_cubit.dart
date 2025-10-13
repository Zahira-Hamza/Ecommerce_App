// features/presentation/pages/cart_screen/cubit/cart_cubit.dart
import 'package:e_commerce_app/domain/entities/response/logged_user_cart/user_cart_response.dart';
import 'package:e_commerce_app/domain/use_cases/item_cart/update_item_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/app_exception.dart';
import '../../../../../domain/use_cases/cart/add_product_to_cart_use_case.dart';
import '../../../../../domain/use_cases/cart/get_user_cart_use_case.dart';
import '../../../../../domain/use_cases/item_cart/delete_item_cart_use_case.dart';

part 'cart_state.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  final AddProductToCartUseCase addProductToCartUseCase;
  final GetUserCartUseCase getUserCartUseCase;
  final UpdateItemCartUseCase updateItemCartUseCase;
  final DeleteItemCartUseCase deleteItemCartUseCase;

  UserCartResponse? _currentCart;
  int _numOfCartItems = 0;

  CartCubit({
    required this.addProductToCartUseCase,
    required this.getUserCartUseCase,
    required this.updateItemCartUseCase,
    required this.deleteItemCartUseCase,
  }) : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of<CartCubit>(context);

  UserCartResponse? get currentCart => _currentCart;
  int get numOfCartItems => _numOfCartItems;

  // FIXED: Add product to cart with quantity
  Future<void> addProductToCart(String productId, {int quantity = 1}) async {
    try {
      emit(CartLoading());

      // Call API multiple times for the quantity (since your API might only support adding 1 at a time)
      for (int i = 0; i < quantity; i++) {
        await addProductToCartUseCase.invoke(productId);
      }

      // Refresh cart to get updated data
      await getUserCart();
    } on AppException catch (e) {
      emit(CartError(message: e.message));
    } catch (e, s) {
      print('❌ CartCubit: Unexpected error - $e');
      print('Stack trace: $s');
      emit(CartError(message: 'An unexpected error occurred'));
    }
  }

  Future<void> getUserCart() async {
    try {
      emit(UserCartLoading());
      final userCartResponse = await getUserCartUseCase.invoke();
      _currentCart = userCartResponse;
      _numOfCartItems = userCartResponse.numOfCartItems ?? 0;
      emit(UserCartLoaded(userCartResponse: userCartResponse));
    } on AppException catch (e) {
      emit(UserCartError(message: e.message));
    } catch (e, s) {
      print('❌ CartCubit: Unexpected error - $e');
      print('Stack trace: $s');
      emit(CartError(message: 'An unexpected error occurred'));
    }
  }

  Future<void> updateItemQuantity(String productId, int newQuantity) async {
    try {
      emit(CartLoading());

      await updateItemCartUseCase.invoke(productId, newQuantity);
      await getUserCart();
    } on AppException catch (e) {
      emit(CartError(message: e.message));
    } catch (e, s) {
      print('❌ CartCubit: Update quantity error - $e');
      print('Stack trace: $s');
      emit(CartError(message: 'Failed to update quantity'));
    }
  }

  Future<void> removeFromCart(String productId) async {
    try {
      emit(CartLoading());

      await deleteItemCartUseCase.invoke(productId);
      await getUserCart();
    } on AppException catch (e) {
      emit(CartError(message: e.message));
    } catch (e, s) {
      print('❌ CartCubit: Delete item error - $e');
      print('Stack trace: $s');
      emit(CartError(message: 'Failed to remove item from cart'));
    }
  }
}
