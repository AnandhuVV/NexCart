import 'package:nexcart/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<void> addToCart(CartItem product);
  Future<bool> isProductInCart(int productId);
  Future<void> removeFromCart(int productId);
  Future<List<CartItem>> getCartItems();
}
