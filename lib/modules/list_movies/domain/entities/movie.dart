import 'dart:convert';

class Movie {
  int id;
  String posterUrl;

  Movie({
    required this.id,
    required this.posterUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'poster_url': posterUrl,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      posterUrl: map['poster_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Movie.fromJson(String source) => Movie.fromMap(json.decode(source));
}
