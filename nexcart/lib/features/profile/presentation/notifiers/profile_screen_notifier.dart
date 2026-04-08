import 'package:nexcart/core/network/errors.dart';
import 'package:nexcart/core/providers/database/database_provider.dart';
import 'package:nexcart/features/authentication/di/auth_providers.dart';
import 'package:nexcart/features/cart/presentation/notifiers/cart_notifier.dart';
import 'package:nexcart/features/products/presentation/notifiers/categories_notifier/categories_notifier.dart';
import 'package:nexcart/features/products/presentation/notifiers/product_detail_notifier/product_detail_notifier.dart';
import 'package:nexcart/features/products/presentation/notifiers/products_list_notifier/products_notifier.dart';
import 'package:nexcart/features/profile/di/profile_data_providers.dart';
import 'package:nexcart/features/profile/domain/entities/user_details_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_screen_notifier.g.dart';

@riverpod
class ProfileScreenNotifier extends _$ProfileScreenNotifier {
  @override
  FutureOr<UserDetailsEntity> build() async {
    final cachedToken = await ref
        .read(authLocalDataSourceProvider)
        .getAccessToken();
    if (cachedToken == null) {
      throw AppException.unauthorised;
    }

    final result = await ref
        .read(getUserDetailsUsecaseProvider)
        .call(cachedToken);

    return result.fold(ifLeft: (error) => throw error, ifRight: (data) => data);
  }

  Future<void> signOut() async {
    ref.read(signOutUseCaseProvider).call();
    ref.read(databaseHelperProvider).clearAllData();

    _invalidateSessionProviders();
  }

  void _invalidateSessionProviders() {
    ref.invalidate(cartProvider);
    ref.invalidate(productsProvider);
    ref.invalidate(productDetailProvider);
    ref.invalidate(categoriesProvider);
  }
}
