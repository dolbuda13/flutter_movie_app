import 'package:flutter_movie_app/domain/entities/movie_detail.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';

class FetchMovieDetail {
  final MovieRepository repository;

  FetchMovieDetail(this.repository);

  Future<MovieDetail?> call(int id) async {
    return await repository.fetchMovieDetail(id);
  }
}
