import 'package:e_commerce_app/domain/entities/common/product.dart';

class LoggedUserProducts {
  final int? count;

  final String? id;

  final Product? product;

  final int? price;

  LoggedUserProducts({
    this.count,
    this.id,
    this.product,
    this.price,
  });
}
