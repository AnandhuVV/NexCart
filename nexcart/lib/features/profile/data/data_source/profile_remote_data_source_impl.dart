import 'package:dart_either/src/dart_either.dart';
import 'package:nexcart/core/network/api_client.dart';
import 'package:nexcart/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:nexcart/features/profile/data/dto_models/user_details_dto.dart';
import 'package:nexcart/features/profile/domain/entities/user_details_entity.dart';

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<Either<Exception, UserDetailsEntity>> getUserDetails(
    String token,
  ) async {
    final response = await apiClient.request(
      path: '/auth/me',
      headers: {
        'Authorization' : 'Bearer $token'
      },
      method: HTTPMethod.get,
    );

    return response.map(
      (response) => UserDetailsDTO.fromJson(response.data).toEntity(),
    );
  }
}
