import 'package:nexcart/core/providers/remote/api_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nexcart/core/providers/secure_storage/secure_storage_provider.dart';
import 'package:nexcart/features/authentication/data/data_sources/local/auth_local_data_source.dart';
import 'package:nexcart/features/authentication/data/data_sources/local/auth_local_data_source_impl.dart';
import 'package:nexcart/features/authentication/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:nexcart/features/authentication/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:nexcart/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:nexcart/features/authentication/domain/repository_contracts/auth_repository.dart';
import 'package:nexcart/features/authentication/domain/use_cases/sign_in_usecase.dart';
import 'package:nexcart/features/authentication/domain/use_cases/sign_out_usecase.dart';

part 'auth_providers.g.dart';

// MARK: Data Sources
@riverpod
AuthLocalDataSource authLocalDataSource(Ref ref) {
  // We use ref.watch to grab the secureStorageProvider we defined above
  final storage = ref.watch(secureStorageProvider);
  return AuthLocalDataSourceImpl(storage);
}

@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthRemoteDataSourceImpl(apiClient);
}

// MARK: Repository
@riverpod
AuthRepository authRepository(Ref ref) {
  final remote = ref.watch(authRemoteDataSourceProvider);
  final local = ref.watch(authLocalDataSourceProvider);
  return AuthRepositoryImpl(remote, local);
}

// MARK: Usecases
@riverpod
SignInUseCase signInUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository);
}

@riverpod
SignOutUseCase signOutUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutUseCase(repository);
}