import 'package:flutter/material.dart';
import 'package:movie_app/modules/detail_movie/data/datasource/detail_movie_remote_datasource.dart';
import 'package:movie_app/modules/detail_movie/data/repositories/find_movie_repository.dart';
import 'package:movie_app/modules/detail_movie/domain/entities/detail_movie.dart';
import 'package:movie_app/modules/detail_movie/domain/usecases/find_movie_usecase.dart';

enum PageState { LOADING, SUCCESS, ERROR }

class DetailMovieController {
  final _findMovieUseCase =
      FindMovieUseCase(FindMovieRepository(DetailMovieRemoteDataSource()));
  final stateNotifier = ValueNotifier<PageState>(PageState.LOADING);

  DetailMovie ?movie;

  PageState get state => stateNotifier.value;

  Future loadList({required idMovie}) async {
    stateNotifier.value = PageState.LOADING;
    final movieResult = await _findMovieUseCase(idMovie);
    movieResult.fold(
      (failure) {
        stateNotifier.value = PageState.ERROR;
      },
      (movieFind) {
        stateNotifier.value = PageState.SUCCESS;
        movie = movieFind;
      },
    );
  }
}
