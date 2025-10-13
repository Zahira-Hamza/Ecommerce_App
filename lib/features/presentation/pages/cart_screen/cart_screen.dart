// import 'package:e_commerce_app/core/utils/app_styles.dart';
// import 'package:e_commerce_app/features/presentation/pages/cart_screen/widgets/cart_item.dart';
// import 'package:e_commerce_app/features/presentation/pages/cart_screen/widgets/total_price_and_checkout_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../widgets/main_loading_widget.dart';
// import 'cubit/cart_cubit.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen();
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   @override
//   void initState() {
//     super.initState();
//     CartCubit.get(context).getUserCart();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Cart',
//           style: AppStyles.medium14Text.copyWith(fontSize: 20.sp),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(14.sp),
//         child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
//           if (state is UserCartLoading) {
//             return MainLoadingWidget();
//           } else if (state is UserCartLoaded) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.separated(
//                     itemBuilder: (_, index) => const CartItem(),
//                     itemCount: CartCubit.get(context).numOfCartItems,
//                     separatorBuilder: (_, __) => SizedBox(height: 12.h),
//                   ),
//                 ),
//                 TotalPriceAndCheckoutButton(
//                   //   totalPrice: ,
//                   checkoutButtonOnTap: () {},
//                 ),
//                 SizedBox(height: 10.h),
//               ],
//             );
//           } else {
//             return MainLoadingWidget();
//           }
//         }),
//       ),
//     );
//   }
// }
// import 'package:e_commerce_app/core/utils/app_styles.dart';
// import 'package:e_commerce_app/features/presentation/pages/cart_screen/widgets/cart_item.dart';
// import 'package:e_commerce_app/features/presentation/pages/cart_screen/widgets/total_price_and_checkout_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../widgets/main_loading_widget.dart';
// import 'cubit/cart_cubit.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen();
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   @override
//   void initState() {
//     super.initState();
//     CartCubit.get(context).getUserCart();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Cart',
//           style: AppStyles.medium14Text.copyWith(fontSize: 20.sp),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(14.sp),
//         child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
//           if (state is UserCartLoading) {
//             return const MainLoadingWidget();
//           } else if (state is UserCartLoaded) {
//             final userCartResponse = state.userCartResponse;
//             final products = userCartResponse.data?.products ?? [];
//             final int itemCount =
//                 products.length; // Or userCartResponse.numOfCartItems ?? 0
//
//             if (itemCount == 0) {
//               // Empty state
//               return Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.shopping_cart_outlined,
//                         size: 64.sp, color: Colors.grey),
//                     SizedBox(height: 16.h),
//                     Text('Your cart is empty',
//                         style:
//                             AppStyles.medium14Text.copyWith(fontSize: 18.sp)),
//                   ],
//                 ),
//               );
//             }
//
//             // 1. Use API total if available; else compute fallback sum
//             int totalPrice = userCartResponse.data?.totalCartPrice ?? 0;
//             if (totalPrice == 0) {
//               // Fallback: Sum (price * count) for each product (assumes Product has int? price)
//               totalPrice = products.fold<int>(0, (sum, product) {
//                 final unitPrice = product.price ?? 0;
//                 final qty = product.count ?? 0;
//                 return sum + (unitPrice * qty);
//               });
//             }
//
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.separated(
//                     itemBuilder: (_, index) => CartItem(
//                       cartItem: products[index], // Pass real data
//                     ),
//                     itemCount: itemCount,
//                     separatorBuilder: (_, __) => SizedBox(height: 12.h),
//                   ),
//                 ),
//                 TotalPriceAndCheckoutButton(
//                   totalPrice: totalPrice, // Now guaranteed >0 if items exist
//                   checkoutButtonOnTap: () {
//                     // TODO: Implement checkout (e.g., navigate to payment screen)
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                           content: Text('Proceeding to checkout...')),
//                     );
//                   },
//                 ),
//                 SizedBox(height: 10.h),
//               ],
//             );
//           } else {
//             // Fallback: Error or other states (you can add specific error handling)
//             return const MainLoadingWidget();
//           }
//         }),
//       ),
//     );
//   }
// }
// cart_screen.dart - UPDATED WITH BETTER STATE HANDLING
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/presentation/pages/cart_screen/widgets/cart_item.dart';
import 'package:e_commerce_app/features/presentation/pages/cart_screen/widgets/total_price_and_checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/main_loading_widget.dart';
import 'cubit/cart_cubit.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    CartCubit.get(context).getUserCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: AppStyles.medium14Text.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(14.sp),
        child: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
          if (state is UserCartLoading) {
            return MainLoadingWidget();
          } else if (state is UserCartLoaded) {
            final userCartResponse = state.userCartResponse;
            final products = userCartResponse.data?.products ?? [];
            final int itemCount = products.length;

            if (itemCount == 0) {
              // Empty state - using the logic from uncommented code
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_outlined,
                        size: 64.sp, color: Colors.grey),
                    SizedBox(height: 16.h),
                    Text('Your cart is empty',
                        style:
                            AppStyles.medium14Text.copyWith(fontSize: 18.sp)),
                    SizedBox(height: 8.h),
                    Text('Add some products to get started',
                        style: AppStyles.regular12Text),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Continue Shopping'),
                    ),
                  ],
                ),
              );
            }

            // Calculate total price using logic from uncommented code
            int totalPrice = userCartResponse.data?.totalCartPrice ?? 0;
            if (totalPrice == 0) {
              totalPrice = products.fold<int>(0, (sum, product) {
                final unitPrice = product.price ?? 0;
                final qty = product.count ?? 0;
                return sum + (unitPrice * qty);
              });
            }

            // Using the design/layout structure from commented code
            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) => CartItem(
                      cartItem: products[index], // Using real data from logic
                    ),
                    itemCount: itemCount, // Using dynamic count from logic
                    separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  ),
                ),
                TotalPriceAndCheckoutButton(
                  totalPrice: totalPrice, // Using calculated total from logic
                  checkoutButtonOnTap: () {
                    // Using logic from uncommented code
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Proceeding to checkout...')),
                    );
                  },
                ),
                SizedBox(height: 10.h),
              ],
            );
          } else if (state is CartError) {
            // Error state from uncommented code logic
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64.sp, color: Colors.red),
                  SizedBox(height: 16.h),
                  Text('Error loading cart',
                      style: AppStyles.medium14Text.copyWith(fontSize: 18.sp)),
                  SizedBox(height: 8.h),
                  Text(state.message,
                      style: AppStyles.regular12Text,
                      textAlign: TextAlign.center),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CartCubit>().getUserCart();
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          } else {
            return MainLoadingWidget();
          }
        }),
      ),
    );
  }
}
