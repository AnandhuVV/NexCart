import 'package:nexcart/features/products/domain/entities/product_entity.dart';

class CartDisplayItem {
  final ProductEntity product;
  final int quantity;

  const CartDisplayItem({required this.product, required this.quantity});

  double get totalPrice => product.price * quantity;
}
