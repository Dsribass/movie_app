import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/modules/list_movies/data/repositories/movies_repository.dart';

import 'package:movie_app/modules/list_movies/domain/usecases/get_movies_usecase.dart';

class MoviesRepositoryMock extends Mock implements IMoviesRepository {}

main() {
  final repository = MoviesRepositoryMock();
  final usecase = GetMoviesUseCase(repository);

  test("Deve retornar lista de movies", () async {
    final result = await usecase();
    expect(result.isRight(), equals(true));
  });
}
