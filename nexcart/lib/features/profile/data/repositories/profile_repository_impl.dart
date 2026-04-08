import 'package:dart_either/dart_either.dart';
import 'package:nexcart/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:nexcart/features/profile/domain/entities/user_details_entity.dart';
import 'package:nexcart/features/profile/domain/repository_contracts/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  const ProfileRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Exception, UserDetailsEntity>> getUserDetails(
    String token,
  ) async {
    return await _remoteDataSource.getUserDetails(token);
  }
}
