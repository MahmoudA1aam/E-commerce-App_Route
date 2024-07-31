class FailuresErrors {
  String? errorMessage;

  FailuresErrors({this.errorMessage});
}

class ServerError extends FailuresErrors {
  ServerError({required super.errorMessage});
}

class NetworkError extends FailuresErrors {
  NetworkError({required super.errorMessage});
}
