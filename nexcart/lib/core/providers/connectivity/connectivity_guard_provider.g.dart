// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_guard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(connectivityGuard)
final connectivityGuardProvider = ConnectivityGuardProvider._();

final class ConnectivityGuardProvider
    extends
        $FunctionalProvider<
          ConnectivityGuard,
          ConnectivityGuard,
          ConnectivityGuard
        >
    with $Provider<ConnectivityGuard> {
  ConnectivityGuardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityGuardProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityGuardHash();

  @$internal
  @override
  $ProviderElement<ConnectivityGuard> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectivityGuard create(Ref ref) {
    return connectivityGuard(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectivityGuard value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectivityGuard>(value),
    );
  }
}

String _$connectivityGuardHash() => r'ccbaec842495a6e162257de325ce1b80d6b637ec';

@ProviderFor(_connectivity)
final _connectivityProvider = _ConnectivityProvider._();

final class _ConnectivityProvider
    extends $FunctionalProvider<Connectivity, Connectivity, Connectivity>
    with $Provider<Connectivity> {
  _ConnectivityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_connectivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_connectivityHash();

  @$internal
  @override
  $ProviderElement<Connectivity> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Connectivity create(Ref ref) {
    return _connectivity(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Connectivity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Connectivity>(value),
    );
  }
}

String _$_connectivityHash() => r'a67b2f9da97640111891863488e1c685dca9d4b9';

@ProviderFor(connectivityStatus)
final connectivityStatusProvider = ConnectivityStatusProvider._();

final class ConnectivityStatusProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  ConnectivityStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityStatusHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return connectivityStatus(ref);
  }
}

String _$connectivityStatusHash() =>
    r'55f8b8cf72b433abb4a6a3dca5328a9f0899f60c';
