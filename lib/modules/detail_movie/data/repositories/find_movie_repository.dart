import 'package:dartz/dartz.dart';
import 'package:movie_app/modules/detail_movie/data/datasource/detail_movie_remote_datasource.dart';
import 'package:movie_app/modules/detail_movie/domain/entities/detail_movie.dart';
import 'package:movie_app/modules/detail_movie/exceptions/failure_find_movie_exception.dart';

abstract class IFindMovieRepository {
  Future<Either<FailureFindMovieException,DetailMovie>> findOne(int id);
}


class FindMovieRepository implements IFindMovieRepository{
  final IDetailMovieRemoteDataSource _ds;

  FindMovieRepository(this._ds);

  @override
  Future<Either<FailureFindMovieException, DetailMovie>> findOne(int id) async {
    try {
      final response = await _ds.findOne(id);
      return Right(response);
    } on FailureFindMovieException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(FailureFindMovieException(message: "Unexpected Error"));
    }
  }

}