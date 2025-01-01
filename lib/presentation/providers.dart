import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_now_playing_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_popular_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_top_rated_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_upcoming_movies.dart';
import 'package:flutter_movie_app/data/repositories/movie_repository_impl.dart';
import 'package:flutter_movie_app/data/datasources/movie_data_source_impl.dart';

// 데이터 소스 Provider
final movieDataSourceProvider = Provider((ref) => MovieDataSourceImpl());

// 레포지토리 Provider
final movieRepositoryProvider = Provider((ref) {
  final dataSource = ref.watch(movieDataSourceProvider);
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
