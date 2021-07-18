import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';

abstract class IDataSource {
  Future<List<Movie>> fetchAll();
}