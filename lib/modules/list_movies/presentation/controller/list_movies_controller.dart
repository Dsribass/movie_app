
import 'package:flutter/cupertino.dart';
import 'package:movie_app/modules/list_movies/data/datasource/remote_datasource.dart';
import 'package:movie_app/modules/list_movies/data/repositories/movies_repository.dart';
import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';
import 'package:movie_app/modules/list_movies/domain/usecases/get_movies_usecase.dart';

enum PageState {
  START, LOADING, SUCCESS, ERROR
}

class ListMoviesController{
  final _getMoviesUseCase = GetMoviesUseCase(MoviesRepository(RemoteDataSource()));
  PageState state = PageState.START;
  var moviesNotifier = ValueNotifier<List<Movie>>(<Movie>[]);

  get movies => moviesNotifier.value;

  loadList() async{
    state = PageState.LOADING;
    var movies = await _getMoviesUseCase();
    if(movies.isLeft()){
      state = PageState.ERROR;
    }else {
      state = PageState.SUCCESS;
    }
  }

}