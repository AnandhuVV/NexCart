import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/nex_shimmer.dart';
import 'package:nexcart/core/ui/molecules/empty_state.dart';
import 'package:nexcart/core/ui/molecules/error_state.dart';
import 'package:nexcart/features/cart/presentation/notifiers/cart_notifier.dart';
import 'package:nexcart/features/cart/presentation/widgets/molecules/cart_list_tile.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  Widget _getShimmer() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 12,
        children: [
          NexShimmer(height: 100),
          NexShimmer(height: 100),
          NexShimmer(height: 100),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
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
      body: cartState.when(
        loading: () => _getShimmer(),

        error: (error, _) => ErrorState(
          message: error.toString(),
          onRetry: () => ref.invalidate(cartProvider),
        ),

        data: (items) {
          if (items.isEmpty) {
            return const EmptyState(message: 'Your cart is empty!');
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final displayItem = items[index];
              final product = displayItem.product;

              return CartListTile(
                  product: product,
                  onTapDeleteButton: () {
                    ref.read(cartProvider.notifier).removeFromCart(product.id);
                  },
                );
            },
          );
        },
      ),
    );
  }
}
