import 'package:movie_app/modules/detail_movie/domain/entities/detail_movie.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/modules/detail_movie/exceptions/failure_find_movie_exception.dart';

abstract class IDetailMovieRemoteDataSource {
  Future<DetailMovie> findOne(int id);
}

class DetailMovieRemoteDataSource implements IDetailMovieRemoteDataSource{
  @override
  Future<DetailMovie> findOne(int id) async {
    final url = Uri.parse("https://desafio-mobile.nyc3.digitaloceanspaces.com/movies/${id.toString()}");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return DetailMovie.fromJson(response.body);
    } else {
      throw FailureFindMovieException(message: "Cannot Find Movie");
    }
  }
}