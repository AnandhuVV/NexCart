import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/router/app_shell.dart';
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

        return AppShell(selectedIndex: selectedIndex, child: child);
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
