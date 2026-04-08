// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductDetailNotifier)
final productDetailProvider = ProductDetailNotifierFamily._();

final class ProductDetailNotifierProvider
    extends $AsyncNotifierProvider<ProductDetailNotifier, ProductEntity> {
  ProductDetailNotifierProvider._({
    required ProductDetailNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'productDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productDetailNotifierHash();

  @override
  String toString() {
    return r'productDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductDetailNotifier create() => ProductDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is ProductDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productDetailNotifierHash() =>
    r'af43ae8992f04b3628b2d3392bba3884f739e5da';

final class ProductDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductDetailNotifier,
          AsyncValue<ProductEntity>,
          ProductEntity,
          FutureOr<ProductEntity>,
          int
        > {
  ProductDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'productDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ProductDetailNotifierProvider call(int id) =>
      ProductDetailNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'productDetailProvider';
}

abstract class _$ProductDetailNotifier extends $AsyncNotifier<ProductEntity> {
  late final _$args = ref.$arg as int;
  int get id => _$args;

  FutureOr<ProductEntity> build(int id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProductEntity>, ProductEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProductEntity>, ProductEntity>,
              AsyncValue<ProductEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
