import 'package:dartz/dartz.dart';

import 'package:movie_app/modules/list_movies/data/datasource/i_datasource.dart';
import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';
import 'package:movie_app/modules/list_movies/exceptions/failure_get_movies_exception.dart';

abstract class IMoviesRepository {
  Future<Either<FailureGetMoviesException,List<Movie>>> fetchAll();
}

class MoviesRepository implements IMoviesRepository {
  IDataSource _ds;

  MoviesRepository(this._ds);

  @override
  Future<Either<FailureGetMoviesException, List<Movie>>> fetchAll() async{
    try{
      final response = await _ds.fetchAll();
      return Right(response);
    }on FailureGetMoviesException catch(e){
      return Left(e);
    }catch(e){
      return Left(FailureGetMoviesException(message:"Unexpected Error"));
    }
  }

}
