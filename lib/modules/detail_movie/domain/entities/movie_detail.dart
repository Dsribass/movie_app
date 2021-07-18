import 'dart:convert';

class MovieDetail {
  final String id;
  final String backdropUrl;
  final String title;
  final double voteAverage;
  final int runtime;
  final List<String> genres;
  final DateTime releaseDate;
  final int budget;
  final String overview;

  MovieDetail(this.id, this.backdropUrl, this.title, this.voteAverage,
      this.runtime, this.genres, this.releaseDate, this.budget, this.overview);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'backdrop_url': backdropUrl,
      'title': title,
      'vote_average': voteAverage,
      'runtime': runtime,
      'genres': genres,
      'release_date': releaseDate.millisecondsSinceEpoch,
      'budget': budget,
      'overview': overview,
    };
  }

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    return MovieDetail(
      map['id'],
      map['backdrop_url'],
      map['title'],
      map['vote_average'],
      map['runtime'],
      List<String>.from(map['genres']),
      DateTime.fromMillisecondsSinceEpoch(map['release_date']),
      map['budget'],
      map['overview'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetail.fromJson(String source) => MovieDetail.fromMap(json.decode(source));
}
