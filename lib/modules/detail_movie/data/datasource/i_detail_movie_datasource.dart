import 'package:movie_app/modules/detail_movie/domain/entities/movie_detail.dart';

abstract class IDetailMovieDataSource {
  Future<MovieDetail> findOne(int id);
}