import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/list_movies/data/datasource/list_movies_local_datasource.dart';
import 'package:movie_app/modules/list_movies/data/datasource/list_movies_remote_datasource.dart';
import 'package:movie_app/modules/list_movies/data/repositories/get_movies_repository.dart';

import 'package:movie_app/modules/list_movies/domain/usecases/get_movies_usecase.dart';

main() {
  final repository = GetMoviesRepository(ListMoviesLocalDataSource(), ListMoviesRemoteDataSource());
  final usecase = GetMoviesUseCase(repository);

  test("Deve retornar lista de movies", () async {
    final result = await usecase();
    expect(result.isRight(), equals(true));
  });
}
