import 'package:nexcart/features/authentication/di/auth_providers.dart';
import 'package:nexcart/features/splash/domain/use_cases/check_auth_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_screen_providers.g.dart';

@riverpod
CheckAuthUsecase checkAuthUsecase(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return CheckAuthUsecase(authRepository);
}