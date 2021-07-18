import 'package:dartz/dartz.dart';
import 'package:movie_app/modules/detail_movie/data/repositories/find_movie_repository.dart';
import 'package:movie_app/modules/detail_movie/domain/entities/movie_detail.dart';
import 'package:movie_app/modules/detail_movie/exceptions/failure_find_movie_exception.dart';

class FindMovieUseCase {
  IFindMovieRepository _repository;

  FindMovieUseCase(this._repository);

  Future<Either<FailureFindMovieException,List<MovieDetail>>> call(int id){
    return _repository.findOne(id);
  }
}