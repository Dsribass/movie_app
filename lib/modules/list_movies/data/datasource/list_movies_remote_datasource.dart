import 'dart:convert';

import 'package:movie_app/modules/list_movies/exceptions/server_movies_exception.dart';
import 'package:movie_app/modules/list_movies/domain/entities/movie.dart';
import 'package:http/http.dart' as http;

abstract class IListMoviesRemoteDataSource {
  Future<List<Movie>> fetchAll();
}

class ListMoviesRemoteDataSource implements IListMoviesRemoteDataSource {
  @override
  Future<List<Movie>> fetchAll() async {
    final url =
        Uri.parse("https://desafio-mobile.nyc3.digitaloceanspaces.com/movies");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);

      List<Movie> movies = body.map((e) => Movie.fromMap(e)).toList();
      return movies;
    } else {
      throw ServerMoviesException(message: "Unable to get movies");
    }
  }
}
