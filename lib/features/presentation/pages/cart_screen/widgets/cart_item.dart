// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_commerce_app/core/utils/app_routes.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/utils/app_assets.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_styles.dart';
// import '../../../../widgets/product_counter.dart';
//
// class CartItem extends StatelessWidget {
//   const CartItem();
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//
//     return InkWell(
//       onTap: () => Navigator.of(context).pushNamed(
//         AppRoutes.productDetailsRoute,
//       ),
//       child: Container(
//         height: isPortrait ? height * 0.14 : width * 0.23,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.r),
//           border: Border.all(color: AppColors.primary.withOpacity(0.3)),
//         ),
//         child: Row(
//           children: [
//             Container(
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.r),
//                 border: Border.all(color: AppColors.primary.withOpacity(0.3)),
//               ),
//               child: CachedNetworkImage(
//                 imageUrl:
//                     'https://pl.kicksmaniac.com/zdjecia/2022/08/23/508/43/NIKE_AIR_JORDAN_1_RETRO_HIGH_GS_RARE_AIR_MAX_ORANGE-mini.jpg',
//                 fit: BoxFit.cover,
//                 height: isPortrait ? height * 0.142 : height * 0.23,
//                 width: isPortrait ? width * 0.29 : 165.w,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 8.w,
//                   vertical: 8.h,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             'Nike Air Jordon Nike shoes flexible for wo..',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: AppStyles.Bold18Text,
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {},
//                           child: Image.asset(
//                             AppAssets.delete,
//                             color: AppColors.text,
//                             height: 22.h,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             'EGP 399',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: AppStyles.Bold18Text,
//                           ),
//                         ),
//                         ProductCounter(
//                           initialValue: 1,
//                           onIncrement: (quantity) {},
//                           onDecrement: (quantity) {},
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_commerce_app/core/utils/app_routes.dart';
// import 'package:e_commerce_app/features/presentation/pages/cart_screen/cubit/cart_cubit.dart'; // For Cubit calls
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../core/utils/app_assets.dart';
// import '../../../../../core/utils/app_colors.dart';
// import '../../../../../core/utils/app_styles.dart';
// import '../../../../../domain/entities/response/logged_user_cart/logged_user_product.dart';
//
// class CartItem extends StatelessWidget {
//   final LoggedUserProducts cartItem; // NEW: Accept real data
//
//   const CartItem({
//     super.key,
//     required this.cartItem, // Required param
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isPortrait =
//         MediaQuery.of(context).orientation == Orientation.portrait;
//     final width = MediaQuery.sizeOf(context).width;
//     final height = MediaQuery.sizeOf(context).height;
//     final product = cartItem.product; // Extract Product
//     final unitPrice = cartItem.price ?? 0; // Unit price
//     final quantity = cartItem.count ?? 0; // Quantity
//
//     if (product == null) {
//       return const SizedBox.shrink(); // Skip if no product
//     }
//
//     return InkWell(
//       onTap: () => Navigator.of(context).pushNamed(
//         AppRoutes.productDetailsRoute,
//         arguments:
//             product.id, // Pass product ID (adjust if your route uses args)
//       ),
//       child: Container(
//         height: isPortrait ? height * 0.14 : width * 0.23,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.r),
//           border: Border.all(color: AppColors.primary.withOpacity(0.3)),
//         ),
//         child: Row(
//           children: [
//             // Image from product.image (assume String? image in Product)
//             Container(
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.r),
//                 border: Border.all(color: AppColors.primary.withOpacity(0.3)),
//               ),
//               child: CachedNetworkImage(
//                 imageUrl: product.imageCover ??
//                     '', // Assume product.image is URL; fallback to placeholder
//                 fit: BoxFit.cover,
//                 height: isPortrait ? height * 0.142 : height * 0.23,
//                 width: isPortrait ? width * 0.29 : 165.w,
//                 // placeholder: (context, url) => Image.asset(
//                 //   AppAssets.placeholderImage, // Add a placeholder asset if needed
//                 //   fit: BoxFit.cover,
//                 // ),
//                 // errorWidget: (context, url, error) => Image.asset(
//                 //   AppAssets.placeholderImage,
//                 //   fit: BoxFit.cover,
//                 // ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 8.w,
//                   vertical: 8.h,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             product.title ??
//                                 'Unknown Product', // Real name from Product
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: AppStyles.Bold18Text,
//                           ),
//                         ),
//                         // Delete: Call Cubit
//                         BlocBuilder<CartCubit, CartState>(
//                           builder: (context, state) {
//                             return InkWell(
//                               onTap: () {},
//                               child: Image.asset(
//                                 AppAssets.delete,
//                                 color: AppColors.text,
//                                 height: 22.h,
//                               ),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             'EGP $unitPrice', // Real unit price
//                             maxLines: 1,
//                             // overflow: TextOverflow.ellipsis,
//                             style: AppStyles.Bold18Text,
//                           ),
//                         ),
//                         // Counter: Wire to Cubit
//                         // ProductCounter(
//                         //   initialValue: quantity, // Real quantity
//                         //   onIncrement: (newQuantity) {
//                         //     context
//                         //         .read<CartCubit>()
//                         //         .updateQuantity(cartItem.id ?? '', newQuantity);
//                         //   },
//                         //   onDecrement: (newQuantity) {
//                         //     context
//                         //         .read<CartCubit>()
//                         //         .updateQuantity(cartItem.id ?? '', newQuantity);
//                         //   },
//                         // ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// cart_item.dart - UPDATED WITH DELETE FUNCTIONALITY
// cart_item.dart - FIXED TO ENSURE COMPLETE PRODUCT DATA
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/flutter_toast.dart';
import 'package:e_commerce_app/domain/entities/response/logged_user_cart/logged_user_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/common/product.dart';
import '../../../../widgets/product_counter.dart';
import '../cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
  final LoggedUserProducts cartItem;

  const CartItem({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    final product = cartItem.product;
    final unitPrice = cartItem.price ?? 0;
    final quantity = cartItem.count ?? 1;

    if (product == null) {
      return const SizedBox.shrink();
    }

    return InkWell(
      onTap: () => _navigateToProductDetails(context, product),
      child: Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            // Product Image
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColors.primary.withOpacity(0.3)),
              ),
              child: CachedNetworkImage(
                imageUrl: product.imageCover ?? "",
                fit: BoxFit.cover,
                height: isPortrait ? height * 0.142 : height * 0.23,
                width: isPortrait ? width * 0.29 : 165.w,
                placeholder: (context, url) => Container(
                  color: Colors.grey[300],
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey[300],
                  child: Icon(Icons.error, color: Colors.grey[500]),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.title ?? 'Unknown Product',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.Bold18Text,
                          ),
                        ),
                        InkWell(
                          onTap: () => _removeItem(context),
                          child: Image.asset(
                            AppAssets.delete,
                            color: AppColors.text,
                            height: 22.h,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'EGP ${_formatPrice(unitPrice)}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.Bold18Text,
                          ),
                        ),
                        ProductCounter(
                          initialValue: quantity,
                          onIncrement: (newValue) {
                            _updateItemQuantity(context, newValue);
                          },
                          onDecrement: (newValue) {
                            if (newValue == 0) {
                              _removeItem(context);
                            } else {
                              _updateItemQuantity(context, newValue);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToProductDetails(BuildContext context, Product product) {
    // Debug: Print product details to see what data we have
    print('🔄 Navigating to product details:');
    print('📦 Product ID: ${product.id}');
    print('📦 Product Title: ${product.title}');
    print('📦 Product Price: ${product.price}');
    print('📦 Product Description: ${product.description}');
    print('📦 Product ImageCover: ${product.imageCover}');
    print('📦 Product Images: ${product.images}');
    print('📦 Product Ratings Average: ${product.ratingsAverage}');
    print('📦 Product Ratings Quantity: ${product.ratingsQuantity}');

    Navigator.of(context).pushNamed(
      AppRoutes.productDetailsRoute,
      arguments: product,
    );
  }

  void _updateItemQuantity(BuildContext context, int newQuantity) {
    final productId = cartItem.product?.id;
    if (productId != null && productId.isNotEmpty) {
      context.read<CartCubit>().updateItemQuantity(productId, newQuantity);
    }
  }

  void _removeItem(BuildContext context) {
    final productId = cartItem.product?.id;
    if (productId != null && productId.isNotEmpty) {
      context.read<CartCubit>().removeFromCart(productId);

      FlutterToast.show(
        context: context,
        message: 'Product removed from cart',
        type: ToastType.success,
        duration: Duration(seconds: 2),
        position: ToastPosition.bottom,
      );
    }
  }

  String _formatPrice(int price) {
    if (price < 1000) return price.toString();
    return '${(price / 1000).toStringAsFixed(3)}'.replaceAll('.', ',');
  }
}
