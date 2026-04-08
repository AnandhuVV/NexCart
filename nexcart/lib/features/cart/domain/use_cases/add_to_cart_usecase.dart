import 'package:nexcart/features/cart/domain/entities/cart_entity.dart';
import 'package:nexcart/features/cart/domain/repository_contracts/cart_repository.dart';

class AddToCartUsecase {
  AddToCartUsecase(this._repository);

  final CartRepository _repository;

  Future<void> call(CartItem item) async {
    await _repository.addToCart(item);
  }
}