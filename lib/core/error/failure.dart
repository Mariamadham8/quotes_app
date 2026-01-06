import 'package:dio/dio.dart';

 class Failure {
  final String errmessage;
  Failure( this.errmessage);

}

class ServerFailure extends Failure {

  ServerFailure(String message,) : super(message ?? "Server Failure");

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return ServerFailure("Request to API server was cancelled");

      case DioExceptionType.connectionTimeout:
        return ServerFailure( "Connection timeout with API server");

      case DioExceptionType.receiveTimeout:
        return ServerFailure( "Receive timeout in connection with API server");

      case DioExceptionType.sendTimeout:
        return ServerFailure( "Send timeout in connection with API server");

      case DioExceptionType.badCertificate:
        return ServerFailure( "Bad certificate from server");

      case DioExceptionType.badResponse:
        return ServerFailure.fromStatusCode(dioError.response?.statusCode ??0);

      case DioExceptionType.connectionError:
        return ServerFailure(
          "Connection failed. Check your internet connection",
        );

      case DioExceptionType.unknown:
      default:
        return ServerFailure("Something went wrong");
    }
  }

  factory ServerFailure.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return ServerFailure( "Bad request");

      case 401:
        return ServerFailure( "Unauthorized request");

      case 403:
        return ServerFailure( "Forbidden request");

      case 404:
        return ServerFailure( "Request not found");

      case 500:
        return ServerFailure( "Internal server error");

      case 502:
        return ServerFailure("Bad gateway");

      case 503:
        return ServerFailure( "Service unavailable");

      case 504:
        return ServerFailure("Gateway timeout");

      default:
        return ServerFailure(
            "Received invalid status code: $statusCode");
    }
  }
}

class CacheFailure extends Failure {
   CacheFailure(String errmessage) : super(errmessage);

}
class OfflineFailure extends Failure {
  OfflineFailure(String errmessage) : super(errmessage);

}
class UnknownFailure extends Failure {
  UnknownFailure(String errmessage) : super(errmessage);

}
class ApiFailure extends Failure {
  ApiFailure(String errmessage) : super(errmessage);

}
class ValidationFailure extends Failure {
  ValidationFailure(String errmessage) : super(errmessage);

}
class AuthenticationFailure extends Failure {
  AuthenticationFailure(String errmessage) : super(errmessage);

}
class PermissionFailure extends Failure {
  PermissionFailure(String errmessage) : super(errmessage);

}
class NotFoundFailure extends Failure {
  NotFoundFailure(String errmessage) : super(errmessage);

}
class TimeoutFailure extends Failure {
  TimeoutFailure(String errmessage) : super(errmessage);

}
class ConflictFailure extends Failure {
  ConflictFailure(String errmessage) : super(errmessage);

}
class RateLimitFailure extends Failure {
  RateLimitFailure(String errmessage) : super(errmessage);

}