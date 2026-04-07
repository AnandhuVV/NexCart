import 'package:nexcart/authentication/domain/repository_contracts/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<void> execute() async {
    return await repository.signOut();
  }
}