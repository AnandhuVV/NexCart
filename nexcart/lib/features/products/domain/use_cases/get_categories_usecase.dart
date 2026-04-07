import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:nexcart/features/products/domain/repository_contracts/products_repository.dart';

class GetCategoriesUsecase {
  GetCategoriesUsecase(this._repository);

  final ProductsRepository _repository;

  Future<Either<Exception, List<CategoryEntity>>> call() async {
    return _repository.getCategories();
  }
}