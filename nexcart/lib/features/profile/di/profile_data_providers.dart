import 'package:nexcart/core/providers/remote/api_client_provider.dart';
import 'package:nexcart/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:nexcart/features/profile/data/data_source/profile_remote_data_source_impl.dart';
import 'package:nexcart/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:nexcart/features/profile/domain/repository_contracts/profile_repository.dart';
import 'package:nexcart/features/profile/domain/use_cases/get_user_details_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_data_providers.g.dart';

@riverpod
ProfileRemoteDataSource profileRemoteDataSource(Ref ref) {
  return ProfileRemoteDataSourceImpl(ref.watch(apiClientProvider));
}

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepositoryImpl(ref.watch(profileRemoteDataSourceProvider));
}

// MARK : Usecases
@riverpod
GetUserDetailsUsecase getUserDetailsUsecase(Ref ref) {
  return GetUserDetailsUsecase(ref.watch(profileRepositoryProvider));
}
