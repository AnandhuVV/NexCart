import 'package:nexcart/features/products/di/product_providers.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_detail_notifier.g.dart';

@riverpod
class ProductDetailNotifier extends _$ProductDetailNotifier {
  late int _productId;

  @override
  FutureOr<ProductEntity> build(int id) async {
    _productId = id;
    final result = await ref
        .read(getProductDetailsUsecaseProvider)
        .call(_productId);

    return result.fold(ifLeft: (error) => throw error, ifRight: (data) => data);
  }
}
