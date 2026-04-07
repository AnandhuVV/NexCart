import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Exception, UserEntity>> signIn(String email, String password);
  Future<void> signOut();
}