class AppException implements Exception {
  const AppException([this.message, this.prefix]);

  final String? message;
  final String? prefix;

  @override
  String toString() {
    if (prefix == null) {
      return message ?? '';
    }

    return '$prefix: ${message ?? ''}';
  }
}

class NoInternetException extends AppException {
  const NoInternetException([String? message]) : super(message, 'No Internet');
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([String? message])
      : super(message, 'Unauthorized');
}

class RequestTimeOutException extends AppException {
  const RequestTimeOutException([String? message]) : super(message, 'Timeout');
}

class FetchDataException extends AppException {
  const FetchDataException([String? message])
      : super(message, 'Unable to process');
}
