// // product_details.dart - FIXED BUTTON ISSUE
// import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_description.dart';
// import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_image.dart';
// import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_label.dart';
// import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_rating.dart';
// import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../../../../core/utils/app_assets.dart';
// import '../../../../../../../core/utils/app_colors.dart';
// import '../../../../../../../core/utils/app_styles.dart';
// import '../../../../../../../domain/entities/common/product.dart';
// import '../../../../../../widgets/custom_elevated_button.dart';
// import '../../../../../../widgets/product_counter.dart';
// import '../../../../cart_screen/cubit/cart_cubit.dart';
//
// class ProductDetails extends StatefulWidget {
//   const ProductDetails();
//
//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }
//
// class _ProductDetailsState extends State<ProductDetails> {
//   int _quantity = 1;
//   Product? product;
//
//   @override
//   Widget build(BuildContext context) {
//     product = ModalRoute.of(context)?.settings.arguments as Product?;
//
//     if (product == null) {
//       return Scaffold(
//         appBar: AppBar(title: Text('Product Details')),
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//
//     final int totalPrice = (product!.price ?? 0) * _quantity;
//     // Get product from arguments in build method
//     final routeArgs = ModalRoute.of(context)?.settings.arguments;
//     if (routeArgs is Product) {
//       product = routeArgs;
//     }
//
//     return BlocListener<CartCubit, CartState>(
//       listener: (context, state) {
//         if (state is UserCartLoaded) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text('Added $_quantity items to cart!'),
//               duration: Duration(seconds: 2),
//             ),
//           );
//         } else if (state is CartError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(state.message),
//               backgroundColor: Colors.red,
//               duration: Duration(seconds: 2),
//             ),
//           );
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: Text(
//             'Product Details',
//             style: AppStyles.medium18appBarTitle.copyWith(fontSize: 20.sp),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const ImageIcon(
//                 AssetImage(AppAssets.search),
//                 color: AppColors.primary,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.shopping_cart_outlined,
//                 color: AppColors.primary,
//               ),
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsetsDirectional.only(
//               start: 16.w,
//               end: 16.w,
//               bottom: 50.h,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ProductSlider(
//                   items: _getProductImages(product!),
//                   initialIndex: 0,
//                 ),
//                 SizedBox(height: 24.h),
//                 ProductLabel(
//                   name: product!.title ?? 'No Title',
//                   price: 'EGP ${_formatPrice(product!.price ?? 0)}',
//                 ),
//                 SizedBox(height: 16.h),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ProductRating(
//                         buyers: '${product!.ratingsQuantity ?? 0}',
//                         rating:
//                             '${product!.ratingsAverage ?? 0} (${product!.ratingsQuantity ?? 0})',
//                       ),
//                     ),
//                     ProductCounter(
//                       initialValue: _quantity,
//                       onIncrement: (value) {
//                         setState(() {
//                           _quantity = value;
//                         });
//                       },
//                       onDecrement: (value) {
//                         setState(() {
//                           _quantity = value;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 16.h),
//                 ProductDescription(
//                   description:
//                       product!.description ?? 'No description available',
//                 ),
//                 SizedBox(height: 48.h),
//                 Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Total price',
//                           style: AppStyles.medium18primary,
//                         ),
//                         SizedBox(height: 12.h),
//                         Text(
//                           'EGP ${_formatPrice(totalPrice)}',
//                           style: AppStyles.medium18appBarTitle,
//                         ),
//                       ],
//                     ),
//                     SizedBox(width: 33.w),
//                     Expanded(
//                       child: BlocBuilder<CartCubit, CartState>(
//                         builder: (context, state) {
//                           // FIXED: Handle the nullable onTap issue
//                           void addToCart() {
//                             if (state is! CartLoading) {
//                               context.read<CartCubit>().addProductToCart(
//                                     product!.id ?? '',
//                                     quantity: _quantity,
//                                   );
//                             }
//                           }
//
//                           return CustomElevatedButton(
//                             label: state is CartLoading
//                                 ? 'Adding...'
//                                 : 'Add to cart',
//                             onTap: state is CartLoading
//                                 ? null
//                                 : addToCart, // FIXED: No longer nullable
//                             prefixIcon: state is CartLoading
//                                 ? SizedBox(
//                                     width: 16.w,
//                                     height: 16.w,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2,
//                                       color: AppColors.white,
//                                     ),
//                                   )
//                                 : const Icon(
//                                     Icons.add_shopping_cart_outlined,
//                                     color: AppColors.white,
//                                   ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String _formatPrice(int price) {
//     if (price < 1000) return price.toString();
//     return '${(price / 1000).toStringAsFixed(3)}'.replaceAll('.', ',');
//   }
//
//   List<Widget> _getProductImages(Product product) {
//     final List<String> imageUrls = [];
//
//     if (product.imageCover != null && product.imageCover!.isNotEmpty) {
//       imageUrls.add(product.imageCover!);
//     }
//
//     if (product.images != null && product.images!.isNotEmpty) {
//       for (var image in product.images!) {
//         if (image.isNotEmpty) {
//           imageUrls.add(image);
//         }
//       }
//     }
//
//     if (imageUrls.isEmpty) {
//       imageUrls.add('https://via.placeholder.com/400x300?text=No+Image');
//     }
//
//     return imageUrls.map((imageUrl) {
//       return ProductImage(imageUrl: imageUrl);
//     }).toList();
//   }
// }
// product_details.dart - FIXED WITH BETTER DATA HANDLING
import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_description.dart';
import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_image.dart';
import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_label.dart';
import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_rating.dart';
import 'package:e_commerce_app/features/presentation/pages/home_screen/tabs/categories_tab/product_screen/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_styles.dart';
import '../../../../../../../domain/entities/common/product.dart';
import '../../../../../../widgets/custom_elevated_button.dart';
import '../../../../../../widgets/product_counter.dart';
import '../../../../cart_screen/cubit/cart_cubit.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails();

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _quantity = 1;
  Product? product;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getProductFromArguments();
  }

  void _getProductFromArguments() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Product) {
      setState(() {
        product = args;
      });

      // Debug: Print received product data
      print('🎯 Received product in details screen:');
      print('📦 Product ID: ${product?.id}');
      print('📦 Product Title: ${product?.title}');
      print('📦 Product Price: ${product?.price}');
      print('📦 Product Description: ${product?.description}');
      print('📦 Product ImageCover: ${product?.imageCover}');
      print('📦 Product Images: ${product?.images}');
      print('📦 Product Ratings Average: ${product?.ratingsAverage}');
      print('📦 Product Ratings Quantity: ${product?.ratingsQuantity}');
    }
  }

  @override
  Widget build(BuildContext context) {
    // If product is still null, try to get it again
    if (product == null) {
      _getProductFromArguments();
    }

    if (product == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Product Details')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.h),
              Text('Loading product details...'),
            ],
          ),
        ),
      );
    }

    // Use safe defaults for null values
    final int productPrice = product!.price ?? 0;
    final int totalPrice = productPrice * _quantity;
    final String productTitle = product!.title ?? 'No Title Available';
    final String productDescription =
        product!.description ?? 'No description available';
    final double ratingsAverage = product!.ratingsAverage ?? 0.0;
    final int ratingsQuantity = product!.ratingsQuantity ?? 0;

    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is UserCartLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Added $_quantity items to cart!'),
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is CartError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Product Details',
            style: AppStyles.medium18appBarTitle.copyWith(fontSize: 20.sp),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage(AppAssets.search),
                color: AppColors.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 16.w,
              end: 16.w,
              bottom: 50.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductSlider(
                  items: _getProductImages(product!),
                  initialIndex: 0,
                ),
                SizedBox(height: 24.h),
                ProductLabel(
                  name: productTitle,
                  price: 'EGP ${_formatPrice(productPrice)}',
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: ProductRating(
                        buyers: '$ratingsQuantity',
                        rating: '$ratingsAverage ($ratingsQuantity)',
                      ),
                    ),
                    ProductCounter(
                      initialValue: _quantity,
                      onIncrement: (value) {
                        setState(() {
                          _quantity = value;
                        });
                      },
                      onDecrement: (value) {
                        setState(() {
                          _quantity = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                ProductDescription(
                  description: productDescription,
                ),
                SizedBox(height: 48.h),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total price',
                          style: AppStyles.medium18primary,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'EGP ${_formatPrice(totalPrice)}',
                          style: AppStyles.medium18appBarTitle,
                        ),
                      ],
                    ),
                    SizedBox(width: 33.w),
                    Expanded(
                      child: BlocBuilder<CartCubit, CartState>(
                        builder: (context, state) {
                          void addToCart() {
                            if (state is! CartLoading && product?.id != null) {
                              context.read<CartCubit>().addProductToCart(
                                    product!.id!,
                                    quantity: _quantity,
                                  );
                            }
                          }

                          return CustomElevatedButton(
                            label: state is CartLoading
                                ? 'Adding...'
                                : 'Add to cart',
                            onTap: (state is CartLoading || product?.id == null)
                                ? null
                                : addToCart,
                            prefixIcon: state is CartLoading
                                ? SizedBox(
                                    width: 16.w,
                                    height: 16.w,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.white,
                                    ),
                                  )
                                : const Icon(
                                    Icons.add_shopping_cart_outlined,
                                    color: AppColors.white,
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatPrice(int price) {
    if (price < 1000) return price.toString();
    return '${(price / 1000).toStringAsFixed(3)}'.replaceAll('.', ',');
  }

  List<Widget> _getProductImages(Product product) {
    final List<String> imageUrls = [];

    // Add main cover image
    if (product.imageCover != null && product.imageCover!.isNotEmpty) {
      imageUrls.add(product.imageCover!);
    }

    // Add other images from the product.images list
    if (product.images != null && product.images!.isNotEmpty) {
      for (var image in product.images!) {
        if (image.isNotEmpty) {
          imageUrls.add(image);
        }
      }
    }

    // If no images found, use a placeholder
    if (imageUrls.isEmpty) {
      imageUrls.add('https://via.placeholder.com/400x300?text=No+Image');
    }

    // Debug: Print images
    print('🖼️ Product images found: ${imageUrls.length}');
    print('🖼️ Image URLs: $imageUrls');

    return imageUrls.map((imageUrl) {
      return ProductImage(imageUrl: imageUrl);
    }).toList();
  }
}
