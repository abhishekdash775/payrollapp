
// --------------------
// Define ApiError hierarchy here
sealed class ApiError {
  String getDisplayMessage() => "Something went wrong";
}

class NetworkError extends ApiError {
  @override
  String getDisplayMessage() => "No internet connection.";
}

class TimeoutError extends ApiError {
  @override
  String getDisplayMessage() => "Request timed out.";
}

class UnauthorizedError extends ApiError {
  @override
  String getDisplayMessage() => "Unauthorized. Please login again.";
}

class ServerError extends ApiError {
  final int statusCode;
  final String serverMessage;
  ServerError({required this.statusCode, required this.serverMessage}
    );
  @override
  String getDisplayMessage() => serverMessage.isNotEmpty == true
      ? serverMessage
      : "Server error occurred";
}

class UnknownError extends ApiError {
  final String message;
  UnknownError(this.message);
  @override
  String getDisplayMessage() => message;
}
