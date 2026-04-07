// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productsLocalDataSource)
final productsLocalDataSourceProvider = ProductsLocalDataSourceProvider._();

final class ProductsLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ProductsLocalDataSource,
          ProductsLocalDataSource,
          ProductsLocalDataSource
        >
    with $Provider<ProductsLocalDataSource> {
  ProductsLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ProductsLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductsLocalDataSource create(Ref ref) {
    return productsLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsLocalDataSource>(value),
    );
  }
}

String _$productsLocalDataSourceHash() =>
    r'153e785f9e805e9610a64fac41d17c5e25bfdaca';
