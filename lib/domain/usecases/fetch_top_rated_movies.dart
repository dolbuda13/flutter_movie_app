import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';

class FetchTopRatedMovies {
  final MovieRepository repository;

  FetchTopRatedMovies(this.repository);

  Future<List<Movie>?> call() async {
    return await repository.fetchTopRatedMovies();
  }
}
