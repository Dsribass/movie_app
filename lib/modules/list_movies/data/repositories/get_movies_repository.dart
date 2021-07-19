import 'package:dartz/dartz.dart';
import 'package:movie_app/modules/list_movies/data/datasource/list_movies_local_datasource.dart';
import 'package:movie_app/modules/list_movies/data/datasource/list_movies_remote_datasource.dart';

import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';
import 'package:movie_app/modules/list_movies/exceptions/cache_movies_exception.dart';
import 'package:movie_app/modules/list_movies/exceptions/server_movies_exception.dart';
import 'package:movie_app/network/network.dart';

abstract class IGetMoviesRepository {
  Future<Either<Exception,List<Movie>>> fetchAll();
}

class GetMoviesRepository implements IGetMoviesRepository {
  final IListMoviesLocalDataSource _localDataSource;
  final IListMoviesRemoteDataSource _remoteDataSource;
  final Network _network;

  GetMoviesRepository(this._localDataSource, this._remoteDataSource) : _network = Network();

  @override
  Future<Either<Exception, List<Movie>>> fetchAll() async{
    if(await _network.isConnected()){
      return _getMoviesFromRemote();
    }else{
      return _getMoviesFromLocal();
    }
  }

  Future<Either<Exception, List<Movie>>> _getMoviesFromLocal() async {
    try{
      final response = await _localDataSource.fetchAll();
      if(response.isEmpty)
        return Left(EmptyListException(message:"Movies list is empty"));
      return Right(response);
    }on CacheMoviesException catch(e){
      return Left(e);
    }catch(e){
      return Left(CacheMoviesException(message:"Unexpected Error"));
    }
  }

  Future<Either<Exception, List<Movie>>> _getMoviesFromRemote() async{
    try{
      final response = await _remoteDataSource.fetchAll();
      _localDataSource.cacheMovies(response);
      return Right(response);
    }on ServerMoviesException catch(e){
      return Left(e);
    }catch(e){
      return Left(ServerMoviesException(message:"Unexpected Error"));
    }
  }

}
