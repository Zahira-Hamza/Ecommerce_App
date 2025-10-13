import '../../common/brand.dart';
import '../../common/metadata.dart';

class BrandsResponse {
  final int? results;

  final Metadata? metadata;

  final List<Brand>? data;

  BrandsResponse({
    this.results,
    this.metadata,
    this.data,
  });
}
