import 'package:movie_app1/modelo/movie.dart';

class MovieResponse {
  final List<Movie> movies;
  final String error;

  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json)
      : movies = (json["results"] as List)
            .map((i) => new Movie.fromJson(i))
            .toList(),
        error = "";

  MovieResponse.withError(string, errorValue)
      : movies = List(),
        error = errorValue;
}
