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
      final prevStatus = previous?.value;
      final nextStatus = next.value;

      if (nextStatus == null || prevStatus == nextStatus) return;

      // Prevent crashes if the widget was removed from the tree
      if (!context.mounted) return;

      final messenger = ScaffoldMessenger.of(context);

      if (nextStatus == true) {
        // BACK ONLINE
        messenger.clearMaterialBanners();

        // Show a temporary success message
        messenger.showSnackBar(
          const SnackBar(
            content: Text('Back Online'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      } else {
        messenger.showMaterialBanner(
          const MaterialBanner(
            content: Text('No Internet Connection. Viewing offline data.'),
            backgroundColor: Colors.red,
            actions: [
              // Banners require at least one action, even if it's just a dummy 'Dismiss'
              TextButton(
                onPressed: null, // Disable the button, they must reconnect!
                child: Icon(Icons.wifi_off, color: Colors.white),
              ),
            ],
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
                label: 'Home',
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
                label: 'Cart',
              ),

              NavigationDestination(
                icon: const Icon(Icons.person_outline),
                selectedIcon: Icon(
                  Icons.person,
                  color: context.colors.onPrimary,
                ),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
