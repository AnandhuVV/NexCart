import 'package:dio/dio.dart';
import 'package:nexcart/core/config/app_config.dart';
import 'package:nexcart/core/network/api_client.dart';
import 'package:nexcart/core/network/interceptors/auth_interceptor.dart';
import 'package:nexcart/core/providers/secure_storage/secure_storage_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client_provider.g.dart';

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