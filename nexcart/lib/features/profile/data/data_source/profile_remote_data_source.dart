import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/profile/domain/entities/user_details_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<Exception, UserDetailsEntity>> getUserDetails(String token);
}
