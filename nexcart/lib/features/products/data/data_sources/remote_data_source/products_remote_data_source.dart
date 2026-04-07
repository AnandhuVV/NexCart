import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:nexcart/features/products/domain/entities/paginated_products_entity.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';

abstract class ProductsRemoteDataSource {
  Future<Either<Exception, PaginatedProductsEntity>> getProducts({
    int limit = 20,
    int skip = 0,
    String? sortBy,
    String? order,
  });

  Future<Either<Exception, ProductEntity>> getProductById(int id);

  Future<Either<Exception, PaginatedProductsEntity>> searchProducts(String query);

  Future<Either<Exception, PaginatedProductsEntity>> getProductsByCategory(String slug);

  Future<Either<Exception, List<CategoryEntity>>> getCategories();
}