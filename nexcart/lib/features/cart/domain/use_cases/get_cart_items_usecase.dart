import 'package:nexcart/features/cart/domain/entities/cart_entity.dart';
import 'package:nexcart/features/cart/domain/repository_contracts/cart_repository.dart';

class GetCartItemsUsecase {
  GetCartItemsUsecase(this._repository);

  final CartRepository _repository;

  Future<List<CartItem>> call() async {
    return await _repository.getCartItems();
  }
}
