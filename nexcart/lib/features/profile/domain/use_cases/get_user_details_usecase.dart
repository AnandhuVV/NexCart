import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/profile/domain/entities/user_details_entity.dart';
import 'package:nexcart/features/profile/domain/repository_contracts/profile_repository.dart';

class GetUserDetailsUsecase {
  final ProfileRepository _repository;

  const GetUserDetailsUsecase(this._repository);

  Future<Either<Exception, UserDetailsEntity>> call(String token) async {
    return await _repository.getUserDetails(token);
  }
}
