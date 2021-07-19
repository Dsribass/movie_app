import 'dart:convert';

import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DetailMovie {
  final int id;
  final String backdropUrl;
  final String title;
  final double voteAverage;
  final int runtime;
  final List<String> genres;
  final String releaseDate;
  final int budget;
  final String overview;

  String get dateFormat {
    final date = DateTime.parse(releaseDate);
    final dateFormat = DateFormat("MMMM yyyy");
    return dateFormat.format(date);
  }

  DetailMovie(this.id, this.backdropUrl, this.title, this.voteAverage,
      this.runtime, this.genres, this.releaseDate, this.budget, this.overview);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'backdrop_url': backdropUrl,
      'title': title,
      'vote_average': voteAverage,
      'runtime': runtime,
      'genres': genres,
      'release_date': releaseDate,
      'budget': budget,
      'overview': overview,
    };
  }

  factory DetailMovie.fromMap(Map<String, dynamic> map) {
    return DetailMovie(
      map['id'],
      map['backdrop_url'],
      map['title'],
      map['vote_average'],
      map['runtime'],
      List<String>.from(map['genres']),
      map['release_date'],
      map['budget'],
      map['overview'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailMovie.fromJson(String source) => DetailMovie.fromMap(json.decode(source));
}
