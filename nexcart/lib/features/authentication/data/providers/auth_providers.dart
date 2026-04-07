import 'package:dio/dio.dart';
import 'package:nexcart/core/config/app_config.dart';
import 'package:nexcart/core/network/interceptors/auth_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nexcart/features/authentication/data/data_sources/local/auth_local_data_source.dart';
import 'package:nexcart/features/authentication/data/data_sources/local/auth_local_data_source_impl.dart';
import 'package:nexcart/features/authentication/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:nexcart/features/authentication/data/data_sources/remote/auth_remote_data_source_impl.dart';
import 'package:nexcart/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:nexcart/features/authentication/domain/repository_contracts/auth_repository.dart';
import 'package:nexcart/features/authentication/domain/use_cases/sign_in_usecase.dart';
import 'package:nexcart/features/authentication/domain/use_cases/sign_out_usecase.dart';
import 'package:nexcart/core/network/api_client.dart';

part 'auth_providers.g.dart';

// 1. MARK: Core Tools (Singletons)
// Using @Riverpod(keepAlive: true) because these shouldn't be destroyed
// when the user navigates away from the login screen.
@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@Riverpod(keepAlive: true)
ApiClient apiClient(Ref ref) {
  final storage = ref.watch(secureStorageProvider);

  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: AppConfig.connectTimeout,
      receiveTimeout: AppConfig.receiveTimeout,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.add(AuthInterceptor(storage));
  
  return ApiClient(dio);
}

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

// MARK: Use Case
@riverpod
SignInUseCase signInUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInUseCase(repository);
}

// MARK: Use Case
@riverpod
SignOutUseCase signOutUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutUseCase(repository);
}