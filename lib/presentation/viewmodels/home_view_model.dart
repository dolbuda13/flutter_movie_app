import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_now_playing_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_popular_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_top_rated_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_upcoming_movies.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class HomeState {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;

  HomeState({
    required this.nowPlayingMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
  });
}

class HomeViewModel extends Notifier<HomeState?> {
  @override
  HomeState? build() {
    _fetchMovies();
    return null;
  }

  Future<void> _fetchMovies() async {
    try {
      final nowPlayingUsecase = ref.read(fetchNowPlayingMoviesUsecaseProvider);
      final popularUsecase = ref.read(fetchPopularMoviesUsecaseProvider);
      final topRatedUsecase = ref.read(fetchTopRatedMoviesUsecaseProvider);
      final upcomingUsecase = ref.read(fetchUpcomingMoviesUsecaseProvider);

      final nowPlaying = await nowPlayingUsecase();
      final popular = await popularUsecase();
      final topRated = await topRatedUsecase();
      final upcoming = await upcomingUsecase();

      state = HomeState(
        nowPlayingMovies: nowPlaying ?? [],
        popularMovies: popular ?? [],
        topRatedMovies: topRated ?? [],
        upcomingMovies: upcoming ?? [],
      );
    } catch (e) {
      print("Error fetching movies: $e");
    }
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState?>(
  HomeViewModel.new,
);
