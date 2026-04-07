import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';
import 'package:nexcart/features/products/domain/repository_contracts/products_repository.dart';

class GetProductsUsecase {
  GetProductsUsecase(this._repository);
  final ProductsRepository _repository;

  Future<Either<Exception, List<ProductEntity>>> call({
    int limit = 20,
    int skip = 0,
    String? sortBy,
    String? order,
  }) async {
    return _repository.getProducts(
      limit: limit,
      skip: skip,
      sortBy: sortBy,
      order: order,
    );
  }
}