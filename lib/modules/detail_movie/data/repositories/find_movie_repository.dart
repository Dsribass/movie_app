import 'package:dartz/dartz.dart';
import 'package:movie_app/modules/detail_movie/domain/entities/movie_detail.dart';
import 'package:movie_app/modules/detail_movie/exceptions/failure_find_movie_exception.dart';

abstract class IFindMovieRepository {
  Future<Either<FailureFindMovieException,List<MovieDetail>>> findOne(int id);
}

class FindMovieRepository implements IFindMovieRepository{
  @override
  Future<Either<FailureFindMovieException, List<MovieDetail>>> findOne(int id) {
    // TODO: implement findOne
    throw UnimplementedError();
  }

}