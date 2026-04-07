import 'package:dart_either/dart_either.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nexcart/core/network/errors.dart';

enum HTTPMethod { get, post, put, delete, patch }

class ApiClient {
  final Dio _dio;

  // Dependency Injection: Pass the Dio instance in through the constructor.
  ApiClient(this._dio) {
    // Set your base configurations here
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.responseType = ResponseType.json;
  }

  // MARK: Root function for API calls
  Future<Either<AppException, Response>> request({
    required String path,
    required HTTPMethod method,
    Map<String, dynamic>? queryParameters, // For GET URLs (?key=value)
    dynamic data, // For POST/PUT JSON bodies
    Map<String, dynamic>? headers, // For specific request headers
  }) async {
    debugPrint('API Request - Path: $path, Method: ${method.name.toUpperCase()}');

    try {
      // Dio's request method allows us to specify the HTTP method dynamically, so we don't need separate functions for GET/POST/PUT etc.
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          method: method.name.toUpperCase(), // Converts enum 'get' to 'GET'
          headers: headers, // Injects temporary headers without cloning Dio!
        ),
      );

      return Right(
          response); // Success case: Return the response wrapped in a Right
    } on DioException catch (e) {
      // Dio specifically caught a network error (Timeout, 404, 401, no internet)
      return Left(_mapDioException(e));
    } catch (e) {
      // Caught an unexpected Dart error (like a JSON parsing failure)
      return Left(AppException.server);
    }
  }
}

AppException _mapDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
      return AppException.timeout;
    case DioExceptionType.connectionError:
      return AppException.network;
    case DioExceptionType.badResponse:
      return _mapStatusCode(e.response?.statusCode);
    default:
      return AppException.unknown;
  }
}

AppException _mapStatusCode(int? statusCode) {
  return switch (statusCode) {
    401 => AppException.unauthorised,
    429 => AppException.rateLimit,
    final s when (s ?? 0) >= 500 => AppException.server,
    _ => AppException.unknown,
  };
}