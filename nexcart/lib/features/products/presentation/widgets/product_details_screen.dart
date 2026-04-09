import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/nex_shimmer.dart';
import 'package:nexcart/core/ui/atoms/offline_banner.dart';
import 'package:nexcart/core/ui/atoms/primary_button.dart';
import 'package:nexcart/core/ui/molecules/error_state.dart';
import 'package:nexcart/features/cart/presentation/notifiers/cart_notifier.dart';
import 'package:nexcart/features/products/presentation/notifiers/product_detail_notifier/product_detail_notifier.dart';

class ProductDetailScreen extends ConsumerWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final int productId;

  Widget _getShimmer() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [
            NexShimmer(height: 300),
            NexShimmer(height: 50),
            NexShimmer(height: 50),
            NexShimmer(height: 20),
            NexShimmer(height: 20),
            NexShimmer(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productDetailProvider(productId));
    final cartState = ref.watch(cartProvider);
    final cartCount = cartState.value?.length ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.productDetails,
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
        actions: [
          IconButton(
            onPressed: () => context.go('/cart'),
            icon: Badge(
              isLabelVisible: cartCount > 0,
              label: Text("$cartCount"),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),

      bottomNavigationBar: productState.when(
        loading: () => _bottomBarWrapper(
          context,
          PrimaryButton(title: "", onPressed: null, isLoading: true),
        ),

        error: (_, _) => _bottomBarWrapper(
          context,
          PrimaryButton(
            title: context.loc.unavailable,
            onPressed: null,
            isLoading: false,
          ),
        ),

        data: (product) {
          return _bottomBarWrapper(
            context,
            cartState.when(
              loading: () =>
                  PrimaryButton(title: "", onPressed: null, isLoading: true),

              error: (_, _) => PrimaryButton(
                title: context.loc.cartUnavailable,
                onPressed: null,
                isLoading: false,
              ),

              data: (items) {
                final isInCart = items.any(
                  (item) => item.product.id == product.id,
                );

                return PrimaryButton(
                  title: isInCart
                      ? context.loc.removeFromCart
                      : context.loc.addToCart,
                  onPressed: () {
                    if (isInCart) {
                      ref
                          .read(cartProvider.notifier)
                          .removeFromCart(product.id);
                    } else {
                      ref.read(cartProvider.notifier).addToCart(product);
                    }
                  },
                  isLoading: false,
                );
              },
            ),
          );
        },
      ),

      body: Column(
        children: [
          const OfflineBanner(),

          Expanded(
            child: productState.when(
              loading: () => _getShimmer(),

              error: (error, _) => ErrorState(
                message: context.localizeError(error),
                onRetry: () => ref.invalidate(productDetailProvider(productId)),
              ),

              data: (product) {
                final originalPrice =
                    product.price / (1 - product.discountPercentage / 100);

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: context.colors.surface,
                          child: CachedNetworkImage(
                            imageUrl: product.thumbnail,
                            height: 280,
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      Text(
                        product.title,
                        style: context.textStyle.headingMedium,
                      ),

                      const SizedBox(height: 8),

                      Row(
                        children: [
                          if (product.brand != null)
                            Text(
                              product.brand!,
                              style: context.textStyle.bodyMedium.copyWith(
                                color: context.colors.primaryAction,
                              ),
                            ),

                          if (product.brand != null) const SizedBox(width: 12),

                          const Icon(Icons.star, color: Colors.amber, size: 18),

                          const SizedBox(width: 4),

                          Text(
                            product.rating.toStringAsFixed(1),
                            style: context.textStyle.bodyMedium,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: context.textStyle.headingMedium.copyWith(
                              color: context.colors.primaryAction,
                            ),
                          ),

                          const SizedBox(width: 12),

                          Text(
                            '\$${originalPrice.toStringAsFixed(2)}',
                            style: context.textStyle.bodyMedium.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: context.colors.textSecondary,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: context.colors.surfaceTint,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          context.loc.availabilityStatusWithStock(
                            product.availabilityStatus,
                            product.stock,
                          ),
                          style: context.textStyle.bodyNormal,
                        ),
                      ),

                      const SizedBox(height: 24),

                      Text(
                        context.loc.description,
                        style: context.textStyle.bodySemibold,
                      ),

                      const SizedBox(height: 8),

                      Text(
                        product.description,
                        style: context.textStyle.bodyNormal,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBarWrapper(BuildContext context, Widget child) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: context.colors.surfaceTint,
      height: 120,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: child,
        ),
      ),
    );
  }
}
