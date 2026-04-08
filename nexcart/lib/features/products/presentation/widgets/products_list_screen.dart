import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/product_card.dart';
import 'package:nexcart/core/ui/atoms/nex_shimmer.dart';
import 'package:nexcart/core/ui/molecules/empty_state.dart';
import 'package:nexcart/core/ui/molecules/error_state.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:nexcart/features/products/domain/entities/paginated_products_entity.dart';
import 'package:nexcart/features/products/presentation/notifiers/products_list_notifier/products_notifier.dart';

class ProductsListScreen extends ConsumerWidget {
  const ProductsListScreen({super.key, required this.selectedCategory});

  final CategoryEntity selectedCategory;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider(selectedCategory.slug, 20));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory.name,
          style: context.textStyle.headingMedium.copyWith(
            color: context.colors.onPrimary,
          ),
        ),
        backgroundColor: context.colors.primaryAction,
        foregroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 16,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref
            .read(productsProvider(selectedCategory.slug, 20).notifier)
            .refresh(),
        child: productsState.when(
          loading: () => _buildShimmerGrid(),
          error: (error, _) => ErrorState(
            message: error.toString(),
            onRetry: () =>
                ref.invalidate(productsProvider(selectedCategory.slug, 20)),
          ),
          data: (paginated) => paginated.products.isEmpty
              ? SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: const EmptyState(message: "No products found"),
                )
              : _buildProductGrid(context, ref, paginated),
        ),
      ),
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: 6, // shimmer placeholders
      itemBuilder: (_, _) => const NexShimmer(height: 100),
    );
  }

  Widget _buildProductGrid(
    BuildContext context,
    WidgetRef ref,
    PaginatedProductsEntity paginated,
  ) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        mainAxisExtent: 285,
      ),
      itemCount: paginated.hasMore
          ? paginated.products.length + 1
          : paginated.products.length,
      itemBuilder: (context, index) {
        // Load more trigger
        if (index == paginated.products.length) {
          ref.read(productsProvider(selectedCategory.slug, 20).notifier).loadMore();
          return const NexShimmer(height: 100); // shimmer at bottom
        }

        final product = paginated.products[index];
        return ProductCard(
          product: product,
          onTap: () => context.push('/products/${product.id}'),
        );
      },
    );
  }
}
