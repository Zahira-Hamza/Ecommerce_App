import 'package:e_commerce_app/domain/entities/common/products_cart.dart';

class CartItem {
  final String? id;

  final String? cartOwner;

  final List<ProductsCart>? products;
  final String? createdAt;

  final String? updatedAt;

  final int? v;

  final int? totalCartPrice;

  CartItem({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
