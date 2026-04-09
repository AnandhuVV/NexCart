import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:nexcart/core/network/connectivity_guard.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connectivity_guard_provider.g.dart';

@Riverpod(keepAlive: true)
ConnectivityGuard connectivityGuard(Ref ref) {
  final connectivity = ref.watch(_connectivityProvider);
  return ConnectivityGuard(connectivity);
}

@Riverpod(keepAlive: true)
Connectivity _connectivity(Ref ref) {
  return Connectivity();
}

@riverpod
Stream<bool> connectivityStatus(Ref ref) {
  return ref.watch(connectivityGuardProvider).onStatusChanged;
}