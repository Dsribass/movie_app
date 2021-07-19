
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/modules/detail_movie/data/datasource/detail_movie_remote_datasource.dart';
import 'package:movie_app/modules/detail_movie/data/repositories/find_movie_repository.dart';
import 'package:movie_app/modules/detail_movie/domain/usecases/find_movie_usecase.dart';

main() {
  final repository = FindMovieRepository(DetailMovieRemoteDataSource());
  final usecase = FindMovieUseCase(repository);

  test("Deve retornar lista de movies", () async {
    final result = await usecase(240);
    expect(result.isRight(), equals(true));
  });
}