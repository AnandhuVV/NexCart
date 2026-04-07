import 'package:dart_either/dart_either.dart';
import 'package:nexcart/authentication/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:nexcart/authentication/data/dto_models/signin_response_dto/signin_response_dto.dart';
import 'package:nexcart/core/network/api_client.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<Either<Exception, SignInResponseDTO>> signIn(String username, String password) async {
    final response = await apiClient.request(path: 'auth/login', method: HTTPMethod.post, data: {
      'username': username,
      'password': password,
    });

    return response.map(
      (response) => SignInResponseDTO.fromJson(response.data),
    );
  }
}