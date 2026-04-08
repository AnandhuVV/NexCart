import 'package:nexcart/features/products/di/product_providers.dart';
import 'package:nexcart/features/products/domain/entities/paginated_products_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_notifier.g.dart';

@Riverpod(keepAlive: true)
class ProductsNotifier extends _$ProductsNotifier {
  //static const int 

  String? _categorySlug;
  late int _limit;

  @override
  FutureOr<PaginatedProductsEntity> build(String? categorySlug, int limit) async {
    _categorySlug = categorySlug;
    _limit = limit;

    return _fetchProducts();
  }

  Future<PaginatedProductsEntity> _fetchProducts({
    int skip = 0,
    String? sortBy,
    String? order,
  }) async {
    final result = await ref
        .read(getProductsUsecaseProvider)
        .call(
          limit: _limit,
          skip: skip,
          sortBy: sortBy,
          order: order,
          categorySlug: _categorySlug,
        );

    return result.fold(ifLeft: (error) => throw error, ifRight: (data) {
      return data;
    });
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore) return;

    final result = await ref
        .read(getProductsUsecaseProvider)
        .call(
          limit: _limit,
          skip: current.skip + _limit,
          categorySlug: _categorySlug,
        );

    result.fold(
      ifLeft: (error) => throw error,
      ifRight: (newData) {
        state = AsyncData(
          PaginatedProductsEntity(
            products: [...current.products, ...newData.products],
            total: newData.total,
            skip: newData.skip,
            limit: newData.limit,
          ),
        );
      },
    );
  }
}
