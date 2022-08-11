import 'package:dio/dio.dart';
import 'package:movie_app1/modelo/cast_response.dart';
import 'package:movie_app1/modelo/genre_response.dart';
import 'package:movie_app1/modelo/movie_detail_response.dart';
import 'package:movie_app1/modelo/movie_response.dart';
import 'package:movie_app1/modelo/person_response.dart';
import 'package:movie_app1/modelo/video_response.dart';

class MovieRepository {
  final String apiKey = "5c2d9d24d5ba64c9c8821e43acc83325";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = "$mainUrl/movie/top_rated";
  var getMoviesUrl = "$mainUrl/discover/movie";
  var getPlayingUrl = "$mainUrl/movie/now_playing";
  var getGenresUrl = "$mainUrl/genre/movie/list";
  var getPersonUrl = "$mainUrl/trending/person/week";
  var movieUrl = "$mainUrl/movie";
  get id => null;

  Future<MovieResponse> getMovies() async {
    var params = {"api_key": apiKey, "language": "es-ES", "page": 1};
    try {
      Response response =
          await _dio.get(getPopularUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exeption ocurred: $error stacktrace: $stacktrace");
      return MovieResponse.withError("$error", "$stacktrace");
    }
  }

  Future<MovieResponse> getPlayingMovies() async {
    var params = {"api_key": apiKey, "language": "en-Us", "page": 1};
    try {
      Response response =
          await _dio.get(getPlayingUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exeption ocurred: $error stacktrace: $stacktrace");
      return MovieResponse.withError("$error", "$stacktrace");
    }
  }

  Future<GenreResponse> getGenres() async {
    var params = {"api_key": apiKey, "language": "en-Us", "page": 1};
    try {
      Response response = await _dio.get(getGenresUrl, queryParameters: params);
      return GenreResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exeption ocurred: $error stacktrace: $stacktrace");
      return GenreResponse.withError("$error", "$stacktrace");
    }
  }

  Future<PersonResponse> getPersons(int id) async {
    var params = {
      "api_key": apiKey,
    };
    try {
      Response response = await _dio.get(getPersonUrl, queryParameters: params);
      return PersonResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exeption ocurred: $error stacktrace: $stacktrace");
      return PersonResponse.withError("$error");
    }
  }

  Future<MovieResponse> getMovieByGenre(int id) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": 1,
      "with_genres": id
    };
    try {
      Response response = await _dio.get(getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exeption ocurred: $error stacktrace: $stacktrace");
      return MovieResponse.withError("$error", "$stacktrace");
    }
  }

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-Us"};
    try {
      Response response =
          await _dio.get(movieUrl + "/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exeption ocurred: $error stacktrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<CastResponse> getCasts(int id) async {
    var params = {"api_key": apiKey, "language": "en-Us"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exeption ocurred: $error stacktrace: $stacktrace");
      return CastResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": apiKey, "language": "en-Us"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/similar",
          queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exeption ocurred: $error stacktrace: $stacktrace");
      return MovieResponse.withError("$error", "$stacktrace");
    }
  }

  Future<VideoResponse> getMovieVideos(int id) async {
    var params = {"api_key": apiKey, "language": "en-Us"};
    try {
      Response response = await _dio.get(movieUrl + "/$id" + "/videos",
          queryParameters: params);
      return VideoResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exeption ocurred: $error stacktrace: $stacktrace");
      return VideoResponse.withError("$error");
    }
  }
}
