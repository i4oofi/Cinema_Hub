import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'Server Failure',
    super.statusCode,
  });

  factory ServerFailure.connectionTimeout() =>
      const ServerFailure(message: 'Connection timeout');

  factory ServerFailure.noInternet() =>
      const ServerFailure(message: 'No internet connection');

  factory ServerFailure.invalidResponse() =>
      const ServerFailure(message: 'Invalid server response');

  factory ServerFailure.notFound() =>
      const ServerFailure(message: 'Resource not found', statusCode: 404);

  factory ServerFailure.unauthorized() =>
      const ServerFailure(message: 'Unauthorized access', statusCode: 401);

  factory ServerFailure.forbidden() =>
      const ServerFailure(message: 'Access forbidden', statusCode: 403);

  factory ServerFailure.serverError() =>
      const ServerFailure(message: 'Internal server error', statusCode: 500);

  factory ServerFailure.badRequest() =>
      const ServerFailure(message: 'Bad request', statusCode: 400);

  factory ServerFailure.fromStatusCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return ServerFailure.badRequest();
      case 401:
        return ServerFailure.unauthorized();
      case 403:
        return ServerFailure.forbidden();
      case 404:
        return ServerFailure.notFound();
      case 500:
      case 501:
      case 503:
        return ServerFailure.serverError();
      default:
        return ServerFailure(
          message: 'Server error with status code: $statusCode',
          statusCode: statusCode,
        );
    }
  }

  bool get isUnauthorized => statusCode == 401;
  bool get isForbidden => statusCode == 403;
  bool get isNotFound => statusCode == 404;
  bool get isServerError => statusCode != null && statusCode! >= 500;
  bool get isBadRequest => statusCode == 400;
}

class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Network Failure',
  });
}

class ValidationFailure extends Failure {
  final Map<String, String>? errors;

  const ValidationFailure({
    super.message = 'Validation Failure',
    this.errors,
  });

  @override
  List<Object?> get props => [...super.props, errors];
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({
    super.message = 'Unexpected error occurred',
  });
}
