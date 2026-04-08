// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductsNotifier)
final productsProvider = ProductsNotifierFamily._();

final class ProductsNotifierProvider
    extends $AsyncNotifierProvider<ProductsNotifier, PaginatedProductsEntity> {
  ProductsNotifierProvider._({
    required ProductsNotifierFamily super.from,
    required (String?, int) super.argument,
  }) : super(
         retry: null,
         name: r'productsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productsNotifierHash();

  @override
  String toString() {
    return r'productsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ProductsNotifier create() => ProductsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ProductsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productsNotifierHash() => r'a80519416a340f145043b8b8042777a9233adce2';

final class ProductsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductsNotifier,
          AsyncValue<PaginatedProductsEntity>,
          PaginatedProductsEntity,
          FutureOr<PaginatedProductsEntity>,
          (String?, int)
        > {
  ProductsNotifierFamily._()
    : super(
        retry: null,
        name: r'productsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ProductsNotifierProvider call(String? categorySlug, int limit) =>
      ProductsNotifierProvider._(argument: (categorySlug, limit), from: this);

  @override
  String toString() => r'productsProvider';
}

abstract class _$ProductsNotifier
    extends $AsyncNotifier<PaginatedProductsEntity> {
  late final _$args = ref.$arg as (String?, int);
  String? get categorySlug => _$args.$1;
  int get limit => _$args.$2;

  FutureOr<PaginatedProductsEntity> build(String? categorySlug, int limit);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PaginatedProductsEntity>,
              PaginatedProductsEntity
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaginatedProductsEntity>,
                PaginatedProductsEntity
              >,
              AsyncValue<PaginatedProductsEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
