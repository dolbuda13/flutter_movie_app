import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/entities/movie_detail.dart';

abstract interface class MovieRepository {
  Future<List<Movie>?> fetchNowPlayingMovies();

  Future<List<Movie>?> fetchPopularMovies();

  Future<List<Movie>?> fetchTopRatedMovies();

  Future<List<Movie>?> fetchUpcomingMovies();

  Future<MovieDetail?> fetchMovieDetail(int id);
}
