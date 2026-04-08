import 'package:dart_either/src/dart_either.dart';
import 'package:nexcart/features/authentication/data/data_sources/local/auth_local_data_source.dart';
import 'package:nexcart/features/authentication/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:nexcart/features/authentication/domain/entities/user_entity.dart';
import 'package:nexcart/features/authentication/domain/repository_contracts/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<Either<Exception, UserEntity>> signIn(
    String username,
    String password,
  ) async {
    final remoteResult = await _remoteDataSource.signIn(username, password);

    return await remoteResult.fold(
      ifLeft: (error) async => Left(error),
      ifRight: (response) async {
        await _localDataSource.saveTokens(
          accessToken: response.accessToken,
          refreshToken: response.refreshToken,
        );

        return Right(
          UserEntity(
            id: response.id,
            fullName: response.fullName,
            email: response.email,
            gender: response.gender,
            image: response.image,
          ),
        );
      },
    );
  }

  @override
  Future<void> signOut() async {
    await _localDataSource.clearTokens();
  }

  @override
  Future<String?> getCachedToken() async {
    final token = await _localDataSource.getAccessToken();
    return token;
  }
}
