import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';

class FetchNowPlayingMovies {
  final MovieRepository repository;

  FetchNowPlayingMovies(this.repository);

  Future<List<Movie>?> call() async {
    return await repository.fetchNowPlayingMovies();
  }
}
