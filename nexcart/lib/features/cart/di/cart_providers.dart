import 'package:nexcart/core/providers/database/database_provider.dart';
import 'package:nexcart/features/cart/data/data_sources/cart_local_data_source.dart';
import 'package:nexcart/features/cart/data/data_sources/cart_local_data_source_impl.dart';
import 'package:nexcart/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:nexcart/features/cart/domain/repository_contracts/cart_repository.dart';
import 'package:nexcart/features/cart/domain/use_cases/add_to_cart_usecase.dart';
import 'package:nexcart/features/cart/domain/use_cases/get_cart_items_usecase.dart';
import 'package:nexcart/features/cart/domain/use_cases/is_product_exist_usecase.dart';
import 'package:nexcart/features/cart/domain/use_cases/remove_from_cart_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_providers.g.dart';

@Riverpod(keepAlive: true)
CartLocalDataSource cartLocalDataSource(Ref ref) {
  return CartLocalDataSourceImpl(ref.watch(databaseHelperProvider));
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(Ref ref) {
  return CartRepositoryImpl(ref.watch(cartLocalDataSourceProvider));
}

// MARK: Usecases
@Riverpod(keepAlive: true)
AddToCartUsecase addToCartUsecase(Ref ref) {
  return AddToCartUsecase(ref.watch(cartRepositoryProvider));
}

@Riverpod(keepAlive: true)
IsProductExistUsecase isProductExistUsecase(Ref ref) {
  return IsProductExistUsecase(ref.watch(cartRepositoryProvider));
}

@Riverpod(keepAlive: true)
RemoveFromCartUsecase removeFromCartUsecase(Ref ref) {
  return RemoveFromCartUsecase(ref.watch(cartRepositoryProvider));
}

@Riverpod(keepAlive: true)
GetCartItemsUsecase getCartItemsUsecase(Ref ref) {
  return GetCartItemsUsecase(ref.watch(cartRepositoryProvider));
}
