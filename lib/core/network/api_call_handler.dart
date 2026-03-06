import 'package:payrollapp/core/network/app_error.dart';
import 'package:payrollapp/core/utility/app_logger.dart';
import 'package:payrollapp/feature/home/data/response/fetch_product.dart';

sealed class ApiCallHandler<T> {
  const ApiCallHandler();
}

class Success<T> extends ApiCallHandler<T> {
  final T data;
  final String? message;

  const Success({required this.data, this.message});
}

class Failure<T> extends ApiCallHandler<T> {
  final ApiError error;

  const Failure({required this.error});
}

extension ApiCallHandlerX<T> on ApiCallHandler<T> {
   Future<void> handle({
    required Future<void> Function(T data) onSuccess,
    required Future<void> Function(String message) onError,
    String? tag,
  }) async {
    switch (this) {
      case Success<T> success:
        onSuccess(success.data);
        break;

      case Failure<T> failure:
        final message = failure.error.getDisplayMessage();
        AppLogger.error(message, tag: tag ?? "ResultFailure");
        onError(failure.error.getDisplayMessage());
        break;
    }
  }
}
