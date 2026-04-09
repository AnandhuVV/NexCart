import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/product_card.dart';
import 'package:nexcart/core/ui/molecules/empty_state.dart';
import 'package:nexcart/core/ui/molecules/error_state.dart';
import 'package:nexcart/features/products/presentation/notifiers/search_notifier/search_notifier.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colors.primaryAction,
        foregroundColor: context.colors.onPrimary,
        scrolledUnderElevation: 0,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        titleSpacing: 16,
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            hintText: context.loc.searchNexCart,
            hintStyle: context.textStyle.bodyMedium.copyWith(
              color: context.colors.onPrimary,
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.clear, color: context.colors.onPrimary),
              onPressed: () {
                _searchController.clear();
                ref.read(searchProvider.notifier).search('');
              },
            ),
          ),
          onChanged: (query) {
            ref.read(searchProvider.notifier).search(query);
          },
        ),
      ),
      body: searchState.when(
        skipLoadingOnReload: true,
        data: (products) {
          if (_searchController.text.isEmpty) {
            return EmptyState(
              message: context.loc.whatAreYouLookingForToday,
            );
          }

          if (products.isEmpty) {
            return EmptyState(message: context.loc.noProductsFound);
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 285,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
                onTap: () {
                  context.push('/products/${product.id}');
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => ErrorState(
          message: context.localizeError(error),
          onRetry: () {
            // Re-trigger the search with the current text
            ref.read(searchProvider.notifier).search(_searchController.text);
          },
        ),
      ),
    );
  }
}
