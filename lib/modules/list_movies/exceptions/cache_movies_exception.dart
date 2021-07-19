class CacheMoviesException implements Exception {
  final String ?message;
  CacheMoviesException({this.message});
}

class FailureCacheMoviesException extends CacheMoviesException {
  FailureCacheMoviesException({String ?message}) : super(message: message);
}

class EmptyListException extends CacheMoviesException {
  EmptyListException({String ?message}) : super(message: message);
}