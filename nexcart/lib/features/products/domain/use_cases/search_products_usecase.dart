import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/products/domain/entities/paginated_products_entity.dart';
import 'package:nexcart/features/products/domain/repository_contracts/products_repository.dart';

class SearchProductsUsecase {
  SearchProductsUsecase(this._repository);
  final ProductsRepository _repository;

  Future<Either<Exception, PaginatedProductsEntity>> call(String query) async {
    return _repository.searchProducts(query);
  }
}