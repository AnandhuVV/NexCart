import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/providers/connectivity/connectivity_guard_provider.dart';
import 'package:nexcart/features/cart/presentation/notifiers/cart_notifier.dart';

class AppShell extends ConsumerWidget {
  const AppShell({super.key, required this.child, required this.selectedIndex});

  final Widget child;
  final int selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<bool>>(connectivityStatusProvider, (previous, next) {
      if (!context.mounted) return;

      final isOnline = next.value == true;
      final wasOffline = previous?.value == false;

      // Internet is back
      if (isOnline && wasOffline) {
        final messenger = ScaffoldMessenger.of(context);
        messenger.clearSnackBars();
        messenger.showSnackBar(
          SnackBar(
            content: Text(context.loc.backOnline),
            backgroundColor: context.colors.success,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    return Scaffold(
      body: child,
      bottomNavigationBar: Consumer(
        builder: (context, ref, _) {
          final cartState = ref.watch(cartProvider);
          final cartCount = cartState.value?.length ?? 0;

          return NavigationBar(
            backgroundColor: context.colors.surface,
            indicatorColor: context.colors.primaryAction,
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              switch (index) {
                case 0:
                  context.go('/home');
                  break;
                case 1:
                  context.go('/cart');
                  break;
                case 2:
                  context.go('/profile');
                  break;
              }
            },
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home, color: context.colors.onPrimary),
                label: context.loc.home,
              ),

              NavigationDestination(
                icon: Badge(
                  isLabelVisible: cartCount > 0,
                  label: Text('$cartCount'),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                selectedIcon: Badge(
                  isLabelVisible: cartCount > 0,
                  label: Text('$cartCount'),
                  child: Icon(
                    Icons.shopping_cart,
                    color: context.colors.onPrimary,
                  ),
                ),
                label: context.loc.cart,
              ),

              NavigationDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: Icon(
                  Icons.person,
                  color: context.colors.onPrimary,
                ),
                label: context.loc.profile,
              ),
            ],
          );
        },
      ),
    );
  }
}
