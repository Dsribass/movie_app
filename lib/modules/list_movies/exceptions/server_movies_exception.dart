
class ServerMoviesException implements Exception {
  final String ?message;
  ServerMoviesException({this.message});
}

class FailureGetMoviesException extends ServerMoviesException {
  FailureGetMoviesException({String ?message}) : super(message: message);
}
