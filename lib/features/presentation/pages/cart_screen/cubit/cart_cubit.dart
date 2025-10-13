// import 'package:e_commerce_app/domain/entities/response/logged_user_cart/user_cart_response.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:meta/meta.dart';
//
// import '../../../../../core/error/app_exception.dart';
// import '../../../../../domain/use_cases/cart/add_product_to_cart_use_case.dart';
// import '../../../../../domain/use_cases/cart/get_user_cart_use_case.dart';
//
// part 'cart_state.dart';
//
// @injectable
// class CartCubit extends Cubit<CartState> {
//   AddProductToCartUseCase addProductToCartUseCase;
//   GetUserCartUseCase getUserCartUseCase;
//
//   int numOfCartItems = 0;
//
//   CartCubit(
//       {required this.addProductToCartUseCase, required this.getUserCartUseCase})
//       : super(CartInitial());
//   static CartCubit get(context) => BlocProvider.of<CartCubit>(context);
//
//   Future<void> addProductToCart(String productId) async {
//     try {
//       emit(CartLoading());
//       var addProductResponse = await addProductToCartUseCase.invoke(productId);
//       var count = addProductResponse.numOfCartItems ?? 0;
//       numOfCartItems = count; // 1. Sync the Cubit field (new line)
//       emit(CartLoaded(numOfCartItems: count)); // 2. Emit state (unchanged)
//     } on AppException catch (e) {
//       emit(CartError(message: e.message));
//     } catch (e, s) {
//       print('❌ CartCubit: Unexpected error - $e');
//       print('Stack trace: $s');
//       emit(CartError(message: 'An unexpected error occurred'));
//     }
//   }
//
//   Future<void> getUserCart() async {
//     try {
//       emit(UserCartLoading());
//       var userCartResponse = await getUserCartUseCase.invoke();
//       numOfCartItems = userCartResponse.numOfCartItems ?? 0;
//       var productList = userCartResponse.data?.products ?? [];
//       emit(UserCartLoaded(
//           userCartResponse: userCartResponse)); // 2. Emit state (unchanged)
//     } on AppException catch (e) {
//       emit(UserCartError(message: e.message));
//     } catch (e, s) {
//       print('❌ CartCubit: Unexpected error - $e');
//       print('Stack trace: $s');
//       emit(CartError(message: 'An unexpected error occurred'));
//     }
//   }
// }
// import 'package:e_commerce_app/domain/entities/response/logged_user_cart/user_cart_response.dart';
// import 'package:e_commerce_app/domain/use_cases/item_cart/update_item_cart_use_case.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:meta/meta.dart';
//
// import '../../../../../core/error/app_exception.dart';
// import '../../../../../domain/use_cases/cart/add_product_to_cart_use_case.dart';
// import '../../../../../domain/use_cases/cart/get_user_cart_use_case.dart';
// import '../../../../../domain/use_cases/item_cart/delete_item_cart_use_case.dart';
//
// part 'cart_state.dart';
//
// @injectable
// class CartCubit extends Cubit<CartState> {
//   AddProductToCartUseCase addProductToCartUseCase;
//   GetUserCartUseCase getUserCartUseCase;
//   UpdateItemCartUseCase updateItemCartUseCase;
//   DeleteItemCartUseCase deleteItemCartUseCase;
//   int numOfCartItems = 0;
//
//   CartCubit(
//       {required this.addProductToCartUseCase,
//       required this.getUserCartUseCase,
//       required this.updateItemCartUseCase,
//       required this.deleteItemCartUseCase})
//       : super(CartInitial());
//   static CartCubit get(context) => BlocProvider.of<CartCubit>(context);
//
//   Future<void> addProductToCart(String productId, {int quantity = 1}) async {
//     try {
//       emit(CartLoading());
//       var addProductResponse = await addProductToCartUseCase.invoke(productId);
//       var count = (addProductResponse.numOfCartItems ?? 0) +
//           (quantity - 1); // Mock for qty >1
//       numOfCartItems = count;
//       emit(CartLoaded(numOfCartItems: count));
//     } on AppException catch (e) {
//       emit(CartError(message: e.message));
//     } catch (e, s) {
//       print('❌ CartCubit: Unexpected error - $e');
//       print('Stack trace: $s');
//       emit(CartError(message: 'An unexpected error occurred'));
//     }
//   }
//
//   Future<void> getUserCart() async {
//     try {
//       emit(UserCartLoading());
//       var userCartResponse = await getUserCartUseCase.invoke();
//       numOfCartItems = userCartResponse.numOfCartItems ?? 0;
//       var productList = userCartResponse.data?.products ?? [];
//       emit(UserCartLoaded(
//           userCartResponse: userCartResponse)); // Emit full response
//     } on AppException catch (e) {
//       emit(UserCartError(message: e.message));
//     } catch (e, s) {
//       print('❌ CartCubit: Unexpected error - $e');
//       print('Stack trace: $s');
//       emit(CartError(message: 'An unexpected error occurred'));
//     }
//   }
//
// }
// cart_cubit.dart - FIXED WITH PROPER STATE MANAGEMENT
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

  // Store current cart state
  UserCartResponse? _currentCart;
  int _numOfCartItems = 0;

  CartCubit({
    required this.addProductToCartUseCase,
    required this.getUserCartUseCase,
    required this.updateItemCartUseCase,
    required this.deleteItemCartUseCase,
  }) : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of<CartCubit>(context);

  // Getter for current cart
  UserCartResponse? get currentCart => _currentCart;

  // Getter for cart items count - FIXED: This was missing
  int get numOfCartItems => _numOfCartItems;

  // ADD PRODUCT TO CART WITH QUANTITY
  Future<void> addProductToCart(String productId, {int quantity = 1}) async {
    try {
      emit(CartLoading());

      // Add product to cart
      final response = await addProductToCartUseCase.invoke(productId);
      _numOfCartItems = response.numOfCartItems ?? 0;

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

  // GET USER CART
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

  // UPDATE ITEM QUANTITY IN CART
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

  // DELETE ITEM FROM CART
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
