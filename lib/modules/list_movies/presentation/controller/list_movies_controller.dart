import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/modules/list_movies/data/datasource/remote_datasource.dart';
import 'package:movie_app/modules/list_movies/data/repositories/get_movies_repository.dart';
import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';
import 'package:movie_app/modules/list_movies/domain/usecases/get_movies_usecase.dart';

enum PageState { LOADING, SUCCESS, ERROR }

class ListMoviesController {
  final _getMoviesUseCase = GetMoviesUseCase(GetMoviesRepository(RemoteDataSource()));
  final stateNotifier = ValueNotifier<PageState>(PageState.LOADING);
  List<Movie> movies = [];

  PageState get state => stateNotifier.value;

  Future loadList() async {
    stateNotifier.value = PageState.LOADING;
    final moviesResult = await _getMoviesUseCase();
    moviesResult.fold(
      (failure) {
        stateNotifier.value = PageState.ERROR;
      },
      (listMovies) {
        stateNotifier.value = PageState.SUCCESS;
        movies = listMovies;
      },
    );
  }
}
