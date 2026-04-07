import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/authentication/domain/entities/user_entity.dart';
import 'package:nexcart/features/authentication/domain/repository_contracts/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Exception, UserEntity>> call(String username, String password) async {
    return await repository.signIn(username, password);
  }
}