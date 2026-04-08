import 'package:nexcart/features/products/di/product_providers.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_notifier.g.dart';

@Riverpod(keepAlive: true)
class CategoriesNotifier extends _$CategoriesNotifier {
  @override
  FutureOr<List<CategoryEntity>> build() async {
    final result = await ref
        .read(getCategoriesUsecaseProvider)
        .call();

    return result.fold(
      ifLeft: (error) => throw error,
      ifRight: (data) => data,
    );
  }

  // Rearranges the categories list to move the selected category to the front
  void reArrange(CategoryEntity selectedCategory) {
    final current = state.value;
    if (current == null) return;

    current.removeWhere((category) => category.name == selectedCategory.name);
    final updated = [selectedCategory, ...current];
    state = AsyncData(updated);
  }
}