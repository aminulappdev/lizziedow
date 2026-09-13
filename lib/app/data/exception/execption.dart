class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_message and $_prefix';
  }
}
 
class NoInternetExecption extends AppException {
  NoInternetExecption([String? message]) : super(message, 'No Internet');
}

class UnAuthorizedExecption extends AppException {
  UnAuthorizedExecption([String? message]) : super(message, 'UnAuthorized');
}

class RequestTimeOutExecption extends AppException {
  RequestTimeOutExecption([String? message]) : super(message, 'TimeOut');
}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Unable to process');
}
