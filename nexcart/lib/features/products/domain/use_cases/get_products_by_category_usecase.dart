import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';
import 'package:nexcart/features/products/domain/repository_contracts/products_repository.dart';

class GetProductsByCategoryUsecase {
  GetProductsByCategoryUsecase(this._repository);
  final ProductsRepository _repository;

  Future<Either<Exception, List<ProductEntity>>> call(String slug) async {
    return _repository.getProductsByCategory(slug);
  }
}