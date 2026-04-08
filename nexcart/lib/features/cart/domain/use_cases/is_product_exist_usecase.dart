import 'package:nexcart/features/cart/domain/repository_contracts/cart_repository.dart';

class IsProductExistUsecase {
  IsProductExistUsecase(this._repository);

  final CartRepository _repository;

  Future<bool> call(int productId) async {
    return await _repository.isProductInCart(productId);
  }
}