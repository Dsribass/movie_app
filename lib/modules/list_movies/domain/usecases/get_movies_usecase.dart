import 'package:dartz/dartz.dart';

import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';
import 'package:movie_app/modules/list_movies/data/repositories/movies_repository.dart';
import 'package:movie_app/modules/list_movies/exceptions/failure_get_movies_exception.dart';

abstract class IGetMoviesUseCase{
    Future<Either<FailureGetMoviesException, List<Movie>>> call();
} 

class GetMoviesUseCase {
  IMoviesRepository _repository;

  GetMoviesUseCase(this._repository);

  Future<Either<FailureGetMoviesException, List<Movie>>> call() async {
    return _repository.fetchAll();
  }
}
