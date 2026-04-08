import 'package:nexcart/features/cart/domain/repository_contracts/cart_repository.dart';

class RemoveFromCartUsecase {
  RemoveFromCartUsecase(this._repository);

  final CartRepository _repository;

  Future<void> call(int productId) async {
    await _repository.removeFromCart(productId);
  }
}