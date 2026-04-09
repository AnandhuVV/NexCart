import 'package:nexcart/features/products/domain/entities/product_entity.dart';

abstract class ProductsLocalDataSource {
  Future<void> cacheProducts(List<ProductEntity> products);
  Future<List<ProductEntity>> getCachedProducts(String? categorySlug);
  Future<ProductEntity?> getCachedProductById(int id);
  Future<void> clearProducts();
}