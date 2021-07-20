import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IListMoviesLocalDataSource {
  Future<List<Movie>> fetchAll();

  Future cacheMovies(List<Movie> movies);
}

class ListMoviesLocalDataSource implements IListMoviesLocalDataSource {
  @override
  Future<List<Movie>> fetchAll() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    final movies = <Movie>[];
    keys.forEach((k) {
      var jsonString = prefs.getString(k);
      if (jsonString != null) {
        movies.add(Movie.fromJson(jsonString));
      }
    });
    return movies;
  }

  @override
  cacheMovies(List<Movie> movies) async {
    final prefs = await SharedPreferences.getInstance();
    movies.forEach(
        (movie) => prefs.setString(movie.id.toString(), movie.toJson())
    );
  }
}
