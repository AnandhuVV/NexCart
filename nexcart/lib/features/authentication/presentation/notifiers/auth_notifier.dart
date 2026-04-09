import 'package:nexcart/features/authentication/di/auth_providers.dart';
import 'package:nexcart/features/authentication/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  
  @override
  FutureOr<UserEntity?> build() async {
    return null;
  }

  Future<void> signIn(String username, String password) async {
    // Instantly trigger the Loading state.
    state = const AsyncValue.loading();

    // Read the Use Case via provider
    final signInUseCase = ref.read(signInUseCaseProvider);

    // Execute the login logic
    final result = await signInUseCase(username, password);

    // Update the state based on the functional Either response
    result.fold(
      ifLeft: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
      ifRight: (user) {
        state = AsyncValue.data(user);
      },
    );
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    try {
      // Tell the repository to wipe the secure vault
      final repository = ref.read(authRepositoryProvider);
      await repository.signOut();
      
      // Destroy the in-memory user state
      state = const AsyncValue.data(null);
      
      // Optional: If you want to force a total app reset (clearing carts, etc.)
      // you can call ref.invalidate() on other providers here.
      
    } catch (e, stackTrace) {
      state = AsyncValue.error('Failed to securely log out: $e', stackTrace);
    }
  }
}
