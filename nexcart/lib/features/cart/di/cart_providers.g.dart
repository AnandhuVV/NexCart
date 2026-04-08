// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cartLocalDataSource)
final cartLocalDataSourceProvider = CartLocalDataSourceProvider._();

final class CartLocalDataSourceProvider
    extends
        $FunctionalProvider<
          CartLocalDataSource,
          CartLocalDataSource,
          CartLocalDataSource
        >
    with $Provider<CartLocalDataSource> {
  CartLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<CartLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CartLocalDataSource create(Ref ref) {
    return cartLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartLocalDataSource>(value),
    );
  }
}

String _$cartLocalDataSourceHash() =>
    r'e8ac3af731cd7644e71810fa2d95b8c070a4b0ad';

@ProviderFor(cartRepository)
final cartRepositoryProvider = CartRepositoryProvider._();

final class CartRepositoryProvider
    extends $FunctionalProvider<CartRepository, CartRepository, CartRepository>
    with $Provider<CartRepository> {
  CartRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartRepositoryHash();

  @$internal
  @override
  $ProviderElement<CartRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CartRepository create(Ref ref) {
    return cartRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CartRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CartRepository>(value),
    );
  }
}

String _$cartRepositoryHash() => r'c207f1e7af33db69ca9325398e58b5f359553bc2';

@ProviderFor(addToCartUsecase)
final addToCartUsecaseProvider = AddToCartUsecaseProvider._();

final class AddToCartUsecaseProvider
    extends
        $FunctionalProvider<
          AddToCartUsecase,
          AddToCartUsecase,
          AddToCartUsecase
        >
    with $Provider<AddToCartUsecase> {
  AddToCartUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addToCartUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addToCartUsecaseHash();

  @$internal
  @override
  $ProviderElement<AddToCartUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AddToCartUsecase create(Ref ref) {
    return addToCartUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddToCartUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddToCartUsecase>(value),
    );
  }
}

String _$addToCartUsecaseHash() => r'7843020f019f778ddea8ae3228ec04a284e9c6b8';

@ProviderFor(isProductExistUsecase)
final isProductExistUsecaseProvider = IsProductExistUsecaseProvider._();

final class IsProductExistUsecaseProvider
    extends
        $FunctionalProvider<
          IsProductExistUsecase,
          IsProductExistUsecase,
          IsProductExistUsecase
        >
    with $Provider<IsProductExistUsecase> {
  IsProductExistUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isProductExistUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isProductExistUsecaseHash();

  @$internal
  @override
  $ProviderElement<IsProductExistUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  IsProductExistUsecase create(Ref ref) {
    return isProductExistUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IsProductExistUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IsProductExistUsecase>(value),
    );
  }
}

String _$isProductExistUsecaseHash() =>
    r'b5c7ae0061fcc7890e95b44c1545d4b1842556f2';

@ProviderFor(removeFromCartUsecase)
final removeFromCartUsecaseProvider = RemoveFromCartUsecaseProvider._();

final class RemoveFromCartUsecaseProvider
    extends
        $FunctionalProvider<
          RemoveFromCartUsecase,
          RemoveFromCartUsecase,
          RemoveFromCartUsecase
        >
    with $Provider<RemoveFromCartUsecase> {
  RemoveFromCartUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'removeFromCartUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$removeFromCartUsecaseHash();

  @$internal
  @override
  $ProviderElement<RemoveFromCartUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RemoveFromCartUsecase create(Ref ref) {
    return removeFromCartUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RemoveFromCartUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RemoveFromCartUsecase>(value),
    );
  }
}

String _$removeFromCartUsecaseHash() =>
    r'eb2ff53adc93590aa050f1d57929506e9e8debe6';

@ProviderFor(getCartItemsUsecase)
final getCartItemsUsecaseProvider = GetCartItemsUsecaseProvider._();

final class GetCartItemsUsecaseProvider
    extends
        $FunctionalProvider<
          GetCartItemsUsecase,
          GetCartItemsUsecase,
          GetCartItemsUsecase
        >
    with $Provider<GetCartItemsUsecase> {
  GetCartItemsUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCartItemsUsecaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCartItemsUsecaseHash();

  @$internal
  @override
  $ProviderElement<GetCartItemsUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCartItemsUsecase create(Ref ref) {
    return getCartItemsUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCartItemsUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCartItemsUsecase>(value),
    );
  }
}

String _$getCartItemsUsecaseHash() =>
    r'887fb3f0e5b7c5c08e982c7f22505d60b5b954d1';
