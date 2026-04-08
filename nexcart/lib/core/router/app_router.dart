import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/features/authentication/presentation/widgets/login_screen.dart';
import 'package:nexcart/features/cart/presentation/notifiers/cart_notifier.dart';
import 'package:nexcart/features/cart/presentation/widgets/cart_screen.dart';
import 'package:nexcart/features/products/domain/entities/category_entity.dart';
import 'package:nexcart/features/products/presentation/widgets/home_screen.dart';
import 'package:nexcart/features/products/presentation/widgets/product_details_screen.dart';
import 'package:nexcart/features/products/presentation/widgets/products_list_screen.dart';
import 'package:nexcart/features/profile/presentation/widgets/profile_screen.dart';
import 'package:nexcart/features/splash/presentation/widgets/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        final location = state.uri.toString();

        int selectedIndex = 0;
        if (location.startsWith('/cart')) selectedIndex = 1;
        if (location.startsWith('/profile')) selectedIndex = 2;

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
                    selectedIcon: Icon(
                      Icons.home,
                      color: context.colors.onPrimary,
                    ),
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
      },
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (_, state) =>
              NoTransitionPage(key: state.pageKey, child: const HomeScreen()),
        ),
        GoRoute(
          path: '/cart',
          pageBuilder: (_, state) =>
              NoTransitionPage(key: state.pageKey, child: const CartScreen()),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (_, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ProfileScreen(),
          ),
        ),
        GoRoute(
          path: '/products_list',
          pageBuilder: (_, state) {
            final category = state.extra as CategoryEntity;
            return NoTransitionPage(
              key: state.pageKey,
              child: ProductsListScreen(selectedCategory: category),
            );
          },
        ),
      ],
    ),

    GoRoute(
      path: '/splash',
      pageBuilder: (_, state) =>
          NoTransitionPage(key: state.pageKey, child: const SplashScreen()),
    ),

    GoRoute(
      path: '/login',
      pageBuilder: (_, state) =>
          NoTransitionPage(key: state.pageKey, child: const LoginScreen()),
    ),

    GoRoute(
      path: '/products/:id',
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);

        return NoTransitionPage(
          key: state.pageKey,
          child: ProductDetailScreen(productId: id),
        );
      },
    ),
  ],
);
