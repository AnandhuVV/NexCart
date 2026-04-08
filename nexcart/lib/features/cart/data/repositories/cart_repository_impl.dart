import 'package:nexcart/features/cart/data/data_sources/cart_local_data_source.dart';
import 'package:nexcart/features/cart/domain/entities/cart_entity.dart';
import 'package:nexcart/features/cart/domain/repository_contracts/cart_repository.dart';

class CartRepositoryImpl extends CartRepository {
  CartLocalDataSource dataSource;

  CartRepositoryImpl(this.dataSource);

  @override
  Future<void> addToCart(CartItem product) async {
    await dataSource.addToCart(product);
  }

  @override
  Future<bool> isProductInCart(int productId) async {
    return await dataSource.isProductInCart(productId);
  }

  @override
  Future<void> removeFromCart(int productId) async {
    await dataSource.removeFromCart(productId);
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    return await dataSource.getCartItems();
  }
}
