import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';

class FetchUpcomingMovies {
  final MovieRepository repository;

  FetchUpcomingMovies(this.repository);

  Future<List<Movie>?> call() async {
    return await repository.fetchUpcomingMovies();
  }
}
