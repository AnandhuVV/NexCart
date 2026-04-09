import 'package:dart_either/dart_either.dart';
import 'package:nexcart/core/network/connectivity_guard.dart';
import 'package:nexcart/core/network/errors.dart';
import 'package:nexcart/features/products/data/data_sources/local_data_source/products_local_data_source.dart';
import 'package:nexcart/features/products/data/data_sources/remote_data_source/products_remote_data_source.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:nexcart/features/products/domain/entities/paginated_products_entity.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';
import 'package:nexcart/features/products/domain/repository_contracts/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  ProductsRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectivityGuard,
  );

  final ProductsRemoteDataSource _remoteDataSource;
  final ProductsLocalDataSource _localDataSource;
  final ConnectivityGuard _connectivityGuard;

  @override
  Future<Either<Exception, PaginatedProductsEntity>> getProducts({
    int limit = 20,
    int skip = 0,
    String? sortBy,
    String? order,
    String? categorySlug,
  }) async {
    final isOnline = await _connectivityGuard.isConnected();

    print(isOnline.toString());

    // Decide based on internet connectivity
    if (!isOnline) {
      final cachedProducts = await _localDataSource.getCachedProducts(
        categorySlug,
      );

      return Right(
        PaginatedProductsEntity(
          products: cachedProducts,
          total: cachedProducts.length,
          skip: 0,
          limit: cachedProducts.length,
        ),
      );
    }

    final remoteResult = await _remoteDataSource.getProducts(
      limit: limit,
      skip: skip,
      sortBy: sortBy,
      order: order,
      categorySlug: categorySlug,
    );

    return remoteResult.fold(
      ifLeft: (error) async {
        final cachedProducts = await _localDataSource.getCachedProducts(
          categorySlug,
        );

        if (cachedProducts.isNotEmpty) {
          return Right(
            PaginatedProductsEntity(
              products: cachedProducts,
              total: cachedProducts.length,
              skip: 0,
              limit: cachedProducts.length,
            ),
          );
        }

        return Left(error);
      },
      ifRight: (paginated) async {
        await _localDataSource.cacheProducts(paginated.products);

        return Right(paginated);
      },
    );
  }

  @override
  Future<Either<Exception, ProductEntity>> getProductById(int id) async {
    final isOnline = await _connectivityGuard.isConnected();

    print(isOnline.toString());

    // Decide based on internet connectivity
    if (!isOnline) {
      final cachedProduct = await _localDataSource.getCachedProductById(id);

      if (cachedProduct != null) return Right(cachedProduct);
      return Left(AppException.network);
    }

    final remoteResult = await _remoteDataSource.getProductById(id);

    return remoteResult.fold(
      ifLeft: (error) async {
        //Try to get from cache if network fails
        final cachedProduct = await _localDataSource.getCachedProductById(id);
        if (cachedProduct != null) return Right(cachedProduct);
        return Left(error);
      },
      ifRight: (product) => Right(product),
    );
  }

  @override
  Future<Either<Exception, PaginatedProductsEntity>> searchProducts(
    String query,
  ) async {
    return _remoteDataSource.searchProducts(query);
  }

  @override
  Future<Either<Exception, List<CategoryEntity>>> getCategories() async {
    return _remoteDataSource.getCategories();
  }
}
