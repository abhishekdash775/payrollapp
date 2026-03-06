import 'package:dio/dio.dart';
import 'package:payrollapp/core/constant/app_endpoints.dart';
import 'package:payrollapp/core/network/api_call_handler.dart';
import 'package:payrollapp/core/network/app_error.dart';

import '../utility/app_logger.dart';

class ApiClient {
  late final Dio _dio;
  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  Future<ApiCallHandler<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      final data = fromJson(response.data);
      AppLogger.json(response.data, tag: path);

      return Success<T>(data: data);
    } on DioException catch (e) {
      return Failure<T>(error: _mapError(e));
    } catch (e) {
      return Failure<T>(error: UnknownError(e.toString()));
    }
  }


  Future<ApiCallHandler<T>> post<T>({
    required String path,
    dynamic body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
      );

      final data = fromJson(response.data);

      return Success<T>(data: data);
    } on DioException catch (e) {
      return Failure<T>(error: _mapError(e));
    } catch (e) {
      return Failure<T>(error: UnknownError(e.toString()));
    }
  }

  Future<ApiCallHandler<T>> put<T>({
    required String path,
    dynamic body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: body,
      );

      final data = fromJson(response.data);

      return Success<T>(data: data);
    } on DioException catch (e) {
      return Failure<T>(error: _mapError(e));
    } catch (e) {
      return Failure<T>(error: UnknownError(e.toString()));
    }
  }


  Future<ApiCallHandler<T>> delete<T>({
    required String path,
    dynamic body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: body,
      );

      final data = fromJson(response.data);

      return Success<T>(data: data);
    } on DioException catch (e) {
      return Failure<T>(error: _mapError(e));
    } catch (e) {
      return Failure<T>(error: UnknownError(e.toString()));
    }
  }


  ApiError _mapError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return TimeoutError();
    }

    if (e.type == DioExceptionType.connectionError) {
      return NetworkError();
    }

    final statusCode = e.response?.statusCode;

    if (statusCode == 401) {
      return UnauthorizedError();
    }

    if (statusCode != null && statusCode >= 500) {
      return ServerError(
        statusCode : statusCode,
        serverMessage: e.response?.data?["message"],
      );
    }

    return UnknownError(
      e.response?.data?["message"] ?? "Unexpected error",
    );
  }
}