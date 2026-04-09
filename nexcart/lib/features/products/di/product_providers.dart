import 'package:nexcart/core/providers/connectivity/connectivity_guard_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nexcart/core/providers/database/database_provider.dart';
import 'package:nexcart/core/providers/remote/api_client_provider.dart';
import 'package:nexcart/features/products/data/data_sources/local_data_source/products_local_data_source.dart';
import 'package:nexcart/features/products/data/data_sources/local_data_source/products_local_data_source_impl.dart';
import 'package:nexcart/features/products/data/data_sources/remote_data_source/products_remote_data_source.dart';
import 'package:nexcart/features/products/data/data_sources/remote_data_source/products_remote_data_source_impl.dart';
import 'package:nexcart/features/products/data/repositories/products_repository_impl.dart';
import 'package:nexcart/features/products/domain/repository_contracts/products_repository.dart';
import 'package:nexcart/features/products/domain/use_cases/get_categories_usecase.dart';
import 'package:nexcart/features/products/domain/use_cases/get_product_details_usecase.dart';
import 'package:nexcart/features/products/domain/use_cases/get_products_usecase.dart';
import 'package:nexcart/features/products/domain/use_cases/search_products_usecase.dart';

part 'product_providers.g.dart';

@riverpod
ProductsLocalDataSource productsLocalDataSource(Ref ref) {
  return ProductsLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}

@riverpod
ProductsRemoteDataSource productsRemoteDataSource(Ref ref) {
  return ProductsRemoteDataSourceImpl(ref.watch(apiClientProvider));
}

@riverpod
ProductsRepository productsRepository(Ref ref) {
  return ProductsRepositoryImpl(
    ref.watch(productsRemoteDataSourceProvider),
    ref.watch(productsLocalDataSourceProvider),
    ref.watch(connectivityGuardProvider),
  );
}

// MARK : Usecases
@riverpod
GetProductsUsecase getProductsUsecase(Ref ref) {
  return GetProductsUsecase(ref.watch(productsRepositoryProvider));
}

@riverpod
GetProductDetailsUsecase getProductDetailsUsecase(Ref ref) {
  return GetProductDetailsUsecase(ref.watch(productsRepositoryProvider));
}

@riverpod
SearchProductsUsecase searchProductsUsecase(Ref ref) {
  return SearchProductsUsecase(ref.watch(productsRepositoryProvider));
}

@riverpod
GetCategoriesUsecase getCategoriesUsecase(Ref ref) {
  return GetCategoriesUsecase(ref.watch(productsRepositoryProvider));
}
