import 'package:e_commerce_app/domain/entities/common/product.dart';

import '../../common/metadata.dart';

class ProductsResponse {
  final int? results;
  final Metadata? metadata;
  final List<Product>? data;

  ProductsResponse({
    this.results,
    this.metadata,
    this.data,
  });
}
