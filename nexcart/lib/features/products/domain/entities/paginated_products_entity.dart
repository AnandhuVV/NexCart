import 'package:nexcart/features/products/domain/entities/product_entity.dart';

class PaginatedProductsEntity {
  final List<ProductEntity> products;
  final int total;
  final int skip;
  final int limit;

  const PaginatedProductsEntity({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  bool get hasMore => skip + limit < total;
}

