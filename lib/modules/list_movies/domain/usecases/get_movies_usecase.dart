import 'package:dartz/dartz.dart';

import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';
import 'package:movie_app/modules/list_movies/data/repositories/get_movies_repository.dart';

abstract class IGetMoviesUseCase{
    Future<Either<Exception, List<Movie>>> call();
} 

class GetMoviesUseCase {
  IGetMoviesRepository _repository;

  GetMoviesUseCase(this._repository);

  Future<Either<Exception, List<Movie>>> call() async {
    return _repository.fetchAll();
  }
}
