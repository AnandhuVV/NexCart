import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/authentication/data/dto_models/signin_response_dto/signin_response_dto.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Exception, SignInResponseDTO>> signIn(String username, String password);
}