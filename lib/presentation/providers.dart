import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_now_playing_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_popular_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_top_rated_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_upcoming_movies.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_app/data/datasources/movie_data_source_impl.dart';
import 'package:flutter_movie_app/domain/entities/movie_detail.dart';



final movieDataSourceProvider = Provider((ref) => MovieDataSourceImpl());


final movieRepositoryProvider = Provider<MovieRepositoryImpl>((ref) {
  final dataSource = MovieDataSourceImpl(); 
  return MovieRepositoryImpl(movieDataSource: dataSource);
});
// Usecase Providers
final fetchNowPlayingMoviesUsecaseProvider = Provider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return FetchNowPlayingMovies(repository);
});

final fetchPopularMoviesUsecaseProvider = Provider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return FetchPopularMovies(repository);
});

final fetchTopRatedMoviesUsecaseProvider = Provider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return FetchTopRatedMovies(repository);
});

final fetchUpcomingMoviesUsecaseProvider = Provider((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return FetchUpcomingMovies(repository);
});

final movieDetailProvider = FutureProvider.family<MovieDetail?, int>((ref, movieId) async {
  final repository = ref.read(movieRepositoryProvider);
  return await repository.fetchMovieDetail(movieId);
});
