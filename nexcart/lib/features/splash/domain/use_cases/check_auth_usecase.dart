import 'package:nexcart/features/authentication/domain/repository_contracts/auth_repository.dart';

class CheckAuthUsecase {
  CheckAuthUsecase(this._authRepository);
  
  final AuthRepository _authRepository;

  Future<bool> call() async {
    final token = await _authRepository.getCachedToken();
    return token != null;
  }
}