import 'package:movie_app/modules/detail_movie/data/datasource/i_datasource.dart';
import 'package:movie_app/modules/detail_movie/domain/entities/movie_detail.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/modules/detail_movie/exceptions/failure_find_movie_exception.dart';

class RemoteDataSource implements IDataSource{
  @override
  Future<MovieDetail> findOne(int id) async {
    final url = Uri.parse("https://desafio-mobile.nyc3.digitaloceanspaces.com/movies/$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return MovieDetail.fromJson(response.body);
    } else {
      throw FailureFindMovieException(message: "Cannot Find Movie");
    }
  }
}