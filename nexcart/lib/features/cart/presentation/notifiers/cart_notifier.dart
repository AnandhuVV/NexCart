import 'package:nexcart/features/cart/di/cart_providers.dart';
import 'package:nexcart/features/cart/domain/entities/cart_display_entity.dart';
import 'package:nexcart/features/cart/domain/entities/cart_entity.dart';
import 'package:nexcart/features/products/di/product_providers.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_notifier.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  FutureOr<List<CartDisplayItem>> build() async {
    return _fetchCartItems();
  }

  // Using product details use case inside cart - for convenience [To get extra product details]
  Future<List<CartDisplayItem>> _fetchCartItems() async {
    final cartItems = await ref.read(getCartItemsUsecaseProvider).call();

    return Future.wait(
      cartItems.map((item) async {
        final product = await ref
            .read(getProductDetailsUsecaseProvider)
            .call(item.productId);

        return product.fold(
          ifLeft: (error) => throw error,
          ifRight: (product) {
            return CartDisplayItem(product: product, quantity: item.quantity);
          },
        );
      }),
    );
  }

  Future<bool> isProductInCart(int productId) async {
    return await ref.read(isProductExistUsecaseProvider).call(productId);
  }

  // Mutates state instantly and then tries to add data to db [for instant cart badge updation]
  // So we take state's count to get badge count
  Future<void> addToCart(ProductEntity product) async {
    final previousItems = state.value ?? [];

    final alreadyExists = previousItems.any(
      (item) => item.product.id == product.id,
    );

    if (alreadyExists) return;

    final updatedItems = [
      ...previousItems,
      CartDisplayItem(product: product, quantity: 1),
    ];

    state = AsyncData(updatedItems);

    try {
      await ref
          .read(addToCartUsecaseProvider)
          .call(CartItem(productId: product.id, quantity: 1));
    } catch (e) {
      state = AsyncData(previousItems);
      rethrow;
    }
  }

  // Mutates state instantly and then tries to add data to db [for instant cart badge updation]
  // So we take state's count to get badge count
  Future<void> removeFromCart(int productId) async {
    final previousItems = state.value ?? [];

    final updatedItems = previousItems
        .where((item) => item.product.id != productId)
        .toList();

    state = AsyncData(updatedItems);

    try {
      await ref.read(removeFromCartUsecaseProvider).call(productId);
    } catch (e) {
      state = AsyncData(previousItems);
      rethrow;
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
