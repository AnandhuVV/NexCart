import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/providers/connectivity/connectivity_guard_provider.dart';
import 'package:nexcart/core/ui/atoms/product_card.dart';
import 'package:nexcart/core/ui/atoms/nex_shimmer.dart';
import 'package:nexcart/core/ui/atoms/see_all_button.dart';
import 'package:nexcart/core/ui/molecules/empty_state.dart';
import 'package:nexcart/core/ui/molecules/error_state.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:nexcart/features/products/presentation/notifiers/products_list_notifier/products_notifier.dart';

class HomeScreenProductsSection extends ConsumerWidget {
  const HomeScreenProductsSection({super.key, required this.selectedCategory});

  final CategoryEntity selectedCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider(selectedCategory.slug, 6));

    ref.listen<AsyncValue<bool>>(connectivityStatusProvider, (previous, next) {
      final wasOffline = previous?.value == false;
      final isOnline = next.value == true;

      // If transitioned from Offline -> Online
      if (wasOffline && isOnline) {
        if (productsState.hasError || (productsState.value?.products.isEmpty ?? false)) {
           ref.invalidate(productsProvider(selectedCategory.slug, 6));
        }
      }
    });

    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(color: context.colors.surface),
          child: SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.loc.products, style: context.textStyle.bodySemibold),
                SeeAllButton(
                  onPressed: () => context.push(
                    '/products_list',
                    extra: selectedCategory,
                  ),
                ),
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: productsState.when(
            loading: () => _buildShimmerGrid(),

            error: (error, _) => ErrorState(
              message: context.localizeError(error),
              onRetry: () {
                ref.invalidate(productsProvider(selectedCategory.slug, 6));
              },
            ),

            data: (paginated) {
              final products = paginated.products.take(6).toList();

              if (products.isEmpty) {
                return EmptyState(message: context.loc.noProductsFound);
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 285,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];

                  return ProductCard(
                    product: product,
                    onTap: () => context.push('/products/${product.id}'),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) => const NexShimmer(height: 100),
    );
  }
}
