import '../../common/category.dart';
import '../../common/metadata.dart';

class CategoryResponse {
  final int? results;
  final Metadata? metadata;
  final List<Category>? data;

  CategoryResponse({
    this.results,
    this.metadata,
    this.data,
  });
}
