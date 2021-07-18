import 'package:dartz/dartz.dart';
import 'package:movie_app/modules/list_movies/data/datasource/list_movies_local_datasource.dart';
import 'package:movie_app/modules/list_movies/data/datasource/list_movies_remote_datasource.dart';

import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';
import 'package:movie_app/modules/list_movies/exceptions/failure_get_movies_exception.dart';
import 'package:movie_app/network/network.dart';

abstract class IGetMoviesRepository {
  Future<Either<FailureGetMoviesException,List<Movie>>> fetchAll();
}

class GetMoviesRepository implements IGetMoviesRepository {
  final IListMoviesLocalDataSource _localDataSource;
  final IListMoviesRemoteDataSource _remoteDataSource;
  final Network _network;

  GetMoviesRepository(this._localDataSource, this._remoteDataSource) : _network = Network();

  @override
  Future<Either<FailureGetMoviesException, List<Movie>>> fetchAll() async{
    if(await _network.isConnected()){
      try{
        final response = await _remoteDataSource.fetchAll();
        _localDataSource.cacheMovies(response);
        print("remoto");
        return Right(response);
      }on FailureGetMoviesException catch(e){
        return Left(e);
      }catch(e){
        return Left(FailureGetMoviesException(message:"Unexpected Error"));
      }
    }else{
      try{
        final response = await _localDataSource.fetchAll();
        print("Local");
        return Right(response);
      }on FailureGetMoviesException catch(e){
        return Left(e);
      }catch(e){
        return Left(FailureGetMoviesException(message:"Unexpected Error"));
      }
    }
  }

}
