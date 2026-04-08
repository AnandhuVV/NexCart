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

@ProviderFor(productsRemoteDataSource)
final productsRemoteDataSourceProvider = ProductsRemoteDataSourceProvider._();

final class ProductsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ProductsRemoteDataSource,
          ProductsRemoteDataSource,
          ProductsRemoteDataSource
        >
    with $Provider<ProductsRemoteDataSource> {
  ProductsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ProductsRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductsRemoteDataSource create(Ref ref) {
    return productsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsRemoteDataSource>(value),
    );
  }
}

String _$productsRemoteDataSourceHash() =>
    r'b594197a8ecb4a1e1660424081946ea5498930cd';

@ProviderFor(productsRepository)
final productsRepositoryProvider = ProductsRepositoryProvider._();

final class ProductsRepositoryProvider
    extends
        $FunctionalProvider<
          ProductsRepository,
          ProductsRepository,
          ProductsRepository
        >
    with $Provider<ProductsRepository> {
  ProductsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductsRepository create(Ref ref) {
    return productsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsRepository>(value),
    );
  }
}

String _$productsRepositoryHash() =>
    r'b426f43dcb1196029821d251cc12c08dbd86db1b';

@ProviderFor(getProductsUsecase)
final getProductsUsecaseProvider = GetProductsUsecaseProvider._();

final class GetProductsUsecaseProvider
    extends
        $FunctionalProvider<
          GetProductsUsecase,
          GetProductsUsecase,
          GetProductsUsecase
        >
    with $Provider<GetProductsUsecase> {
  GetProductsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetProductsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductsUsecase create(Ref ref) {
    return getProductsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductsUsecase>(value),
    );
  }
}

String _$getProductsUsecaseHash() =>
    r'8e8c3d2a39fb8e93a69ed5b9304e7c3259c2cc74';

@ProviderFor(getProductDetailsUsecase)
final getProductDetailsUsecaseProvider = GetProductDetailsUsecaseProvider._();

final class GetProductDetailsUsecaseProvider
    extends
        $FunctionalProvider<
          GetProductDetailsUsecase,
          GetProductDetailsUsecase,
          GetProductDetailsUsecase
        >
    with $Provider<GetProductDetailsUsecase> {
  GetProductDetailsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProductDetailsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProductDetailsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetProductDetailsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetProductDetailsUsecase create(Ref ref) {
    return getProductDetailsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProductDetailsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProductDetailsUsecase>(value),
    );
  }
}

String _$getProductDetailsUsecaseHash() =>
    r'68b41e7d6e066cd3b44746e422d6328ec28be576';

@ProviderFor(searchProductsUsecase)
final searchProductsUsecaseProvider = SearchProductsUsecaseProvider._();

final class SearchProductsUsecaseProvider
    extends
        $FunctionalProvider<
          SearchProductsUsecase,
          SearchProductsUsecase,
          SearchProductsUsecase
        >
    with $Provider<SearchProductsUsecase> {
  SearchProductsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchProductsUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchProductsUsecaseHash();

  @$internal
  @override
  $ProviderElement<SearchProductsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchProductsUsecase create(Ref ref) {
    return searchProductsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchProductsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchProductsUsecase>(value),
    );
  }
}

String _$searchProductsUsecaseHash() =>
    r'ed3df4654dca0fe6dcc5b14c16b90d21071598bf';

@ProviderFor(getCategoriesUsecase)
final getCategoriesUsecaseProvider = GetCategoriesUsecaseProvider._();

final class GetCategoriesUsecaseProvider
    extends
        $FunctionalProvider<
          GetCategoriesUsecase,
          GetCategoriesUsecase,
          GetCategoriesUsecase
        >
    with $Provider<GetCategoriesUsecase> {
  GetCategoriesUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCategoriesUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCategoriesUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetCategoriesUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCategoriesUsecase create(Ref ref) {
    return getCategoriesUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCategoriesUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCategoriesUsecase>(value),
    );
  }
}

String _$getCategoriesUsecaseHash() =>
    r'193f89527f42e266d9ed7145128ab40492b9b326';
