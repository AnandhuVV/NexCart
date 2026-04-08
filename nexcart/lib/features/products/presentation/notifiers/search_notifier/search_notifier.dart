import 'dart:async';
import 'package:nexcart/features/products/di/product_providers.dart';
import 'package:nexcart/features/products/domain/entities/product_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  Timer? _debounceTimer;

  @override
  FutureOr<List<ProductEntity>> build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });

    return [];
  }

  void search(String query) {
    // Cancel previous timer
    _debounceTimer?.cancel();

    if (query.trim().isEmpty) {
      state = const AsyncData([]);
      return;
    }

    // 500ms debounce
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      state = const AsyncLoading();
      final result = await ref.read(searchProductsUsecaseProvider).call(query);

      state = result.fold(
        ifLeft: (error) => AsyncError(error, StackTrace.current),
        ifRight: (data) => AsyncData(data.products),
      );
    });
  }
}
