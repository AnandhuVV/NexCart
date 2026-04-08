// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProfileScreenNotifier)
final profileScreenProvider = ProfileScreenNotifierProvider._();

final class ProfileScreenNotifierProvider
    extends $AsyncNotifierProvider<ProfileScreenNotifier, UserDetailsEntity> {
  ProfileScreenNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileScreenProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileScreenNotifierHash();

  @$internal
  @override
  ProfileScreenNotifier create() => ProfileScreenNotifier();
}

String _$profileScreenNotifierHash() =>
    r'fb744c1947bc2747e9c75184188c7937f390ba07';

abstract class _$ProfileScreenNotifier
    extends $AsyncNotifier<UserDetailsEntity> {
  FutureOr<UserDetailsEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<UserDetailsEntity>, UserDetailsEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserDetailsEntity>, UserDetailsEntity>,
              AsyncValue<UserDetailsEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
