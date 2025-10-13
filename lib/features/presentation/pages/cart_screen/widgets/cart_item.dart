// features/presentation/pages/cart_screen/widgets/cart_item.dart
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
    // Ensure we have all product data by creating a complete product object
    final completeProduct = Product(
      id: product.id,
      title: product.title,
      description: product.description,
      price: product.price ?? cartItem.price, // Fallback to cart item price
      imageCover: product.imageCover,
      images: product.images ?? [], // Ensure images list is not null
      ratingsAverage: product.ratingsAverage ?? 0.0,
      ratingsQuantity: product.ratingsQuantity ?? 0,
      sold: product.sold ?? 0, // Add sold count if available
      // Add any other fields from your Product entity
    );

    // Debug: Print product data to verify
    print('🔄 Navigating with product:');
    print('📦 Title: ${completeProduct.title}');
    print('📦 Description: ${completeProduct.description}');
    print('📦 Price: ${completeProduct.price}');
    print('📦 Images count: ${completeProduct.images?.length}');
    print('📦 Ratings Average: ${completeProduct.ratingsAverage}');
    print('📦 Ratings Quantity: ${completeProduct.ratingsQuantity}');

    Navigator.of(context).pushNamed(
      AppRoutes.productDetailsRoute,
      arguments: completeProduct,
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
