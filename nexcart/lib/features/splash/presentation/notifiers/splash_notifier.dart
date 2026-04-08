import 'dart:async';
import 'package:nexcart/features/splash/di/splash_screen_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_notifier.g.dart';

enum SplashDestination {
  home,
  login,
}

@riverpod
class SplashNotifier extends _$SplashNotifier {
  @override
  Future<SplashDestination> build() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await ref.read(checkAuthUsecaseProvider).call();

    return isLoggedIn
        ? SplashDestination.home
        : SplashDestination.login;
  }
}