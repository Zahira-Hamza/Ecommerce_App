import 'package:json_annotation/json_annotation.dart';

import 'logged_user_product.dart';

@JsonSerializable()
class UserCart {
  final String? id;

  final String? cartOwner;
  final List<LoggedUserProducts>? products;
  final String? createdAt;
  final String? updatedAt;
  final int? v;
  final int? totalCartPrice;

  UserCart({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
