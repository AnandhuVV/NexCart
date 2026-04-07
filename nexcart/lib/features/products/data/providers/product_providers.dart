import 'package:nexcart/core/providers/database/database_provider.dart';
import 'package:nexcart/features/products/data/data_sources/local_data_source/products_local_data_source.dart';
import 'package:nexcart/features/products/data/data_sources/local_data_source/products_local_data_source_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_providers.g.dart';

@riverpod
ProductsLocalDataSource productsLocalDataSource(Ref ref) {
  return ProductsLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}