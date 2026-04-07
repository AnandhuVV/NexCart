import 'package:dart_either/dart_either.dart';
import 'package:nexcart/core/network/api_client.dart';
import 'package:nexcart/features/products/data/data_sources/remote_data_source/products_remote_data_source.dart';
import 'package:nexcart/features/products/data/dto_models/category_dto/category_dto.dart';
import 'package:nexcart/features/products/data/dto_models/product_dto/product_dto.dart';
import 'package:nexcart/features/products/data/dto_models/products_response_dto/products_response_dto.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:nexcart/features/products/domain/entities/paginated_products_entity.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';

class ProductsRemoteDataSourceImpl extends ProductsRemoteDataSource {
  ProductsRemoteDataSourceImpl(this._apiClient);

  final ApiClient _apiClient;

  @override
  Future<Either<Exception, PaginatedProductsEntity>> getProducts({
    int limit = 20,
    int skip = 0,
    String? sortBy,
    String? order,
  }) async {
    final response = await _apiClient.request(
      path: '/products',
      method: HTTPMethod.get,
      queryParameters: {
        'limit': limit,
        'skip': skip,
        if (sortBy != null) 'sortBy': sortBy,
        if (order != null) 'order': order,
      },
    );

    return response.map(
      (response) => ProductsResponseDTO.fromJson(response.data).toEntity(),
    );
  }

  @override
  Future<Either<Exception, ProductEntity>> getProductById(int id) async {
    final response = await _apiClient.request(
      path: '/products/$id',
      method: HTTPMethod.get,
    );

    return response.map(
      (response) => ProductDTO.fromJson(response.data).toEntity(),
    );
  }

  @override
  Future<Either<Exception, PaginatedProductsEntity>> searchProducts(
    String query,
  ) async {
    final response = await _apiClient.request(
      path: '/products/search',
      method: HTTPMethod.get,
      queryParameters: {'q': query},
    );

    return response.map(
      (response) => ProductsResponseDTO.fromJson(response.data).toEntity(),
    );
  }

  @override
  Future<Either<Exception, PaginatedProductsEntity>> getProductsByCategory(
    String slug,
  ) async {
    final response = await _apiClient.request(
      path: '/products/category/$slug',
      method: HTTPMethod.get,
    );

    return response.map(
      (response) => ProductsResponseDTO.fromJson(response.data).toEntity(),
    );
  }

  @override
  Future<Either<Exception, List<CategoryEntity>>> getCategories() async {
    final response = await _apiClient.request(
      path: '/products/categories',
      method: HTTPMethod.get,
    );

    return response.map(
      (response) => (response.data as List)
          .map((json) => CategoryDTO.fromJson(json).toEntity())
          .toList(),
    );
  }
}
