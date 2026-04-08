// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(checkAuthUsecase)
final checkAuthUsecaseProvider = CheckAuthUsecaseProvider._();

final class CheckAuthUsecaseProvider
    extends
        $FunctionalProvider<
          CheckAuthUsecase,
          CheckAuthUsecase,
          CheckAuthUsecase
        >
    with $Provider<CheckAuthUsecase> {
  CheckAuthUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkAuthUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkAuthUsecaseHash();

  @$internal
  @override
  $ProviderElement<CheckAuthUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CheckAuthUsecase create(Ref ref) {
    return checkAuthUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckAuthUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckAuthUsecase>(value),
    );
  }
}

String _$checkAuthUsecaseHash() => r'32f84559108205f62b9aadc3beeee7f3738e5ac8';
