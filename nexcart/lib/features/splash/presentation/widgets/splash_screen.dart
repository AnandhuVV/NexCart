import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/features/splash/presentation/notifiers/splash_notifier.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashProvider, (_, next) {
      next.whenData((destination) {
        switch (destination) {
          case SplashDestination.home:
            context.go('/home');
            break;

          case SplashDestination.login:
            context.go('/login');
            break;
        }
      });
    });

    ref.watch(splashProvider);

    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            Image.asset(
              'assets/images/app_logo_inside.png',
              width: 120,
              height: 120,
            ),
            Text(
              'NexCart',
              style: context.textStyle.headingLarge.copyWith(
                color: context.colors.textPrimary,
              ),
            ),
            const CircularProgressIndicator.adaptive(),
          ],
        ),
      ),
    );
  }
}
