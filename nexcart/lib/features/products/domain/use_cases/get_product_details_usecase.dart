import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';
import 'package:nexcart/features/products/domain/repository_contracts/products_repository.dart';

class GetProductDetailsUsecase {
  GetProductDetailsUsecase(this._repository);
  final ProductsRepository _repository;

  Future<Either<Exception, ProductEntity>> call(int id) async {
    return _repository.getProductById(id);
  }
}