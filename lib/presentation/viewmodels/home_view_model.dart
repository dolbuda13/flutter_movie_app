import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_now_playing_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_popular_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_top_rated_movies.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_upcoming_movies.dart';

class HomeViewModel extends ChangeNotifier {
  final FetchNowPlayingMovies fetchNowPlayingMovies;
  final FetchPopularMovies fetchPopularMovies;
  final FetchTopRatedMovies fetchTopRatedMovies;
  final FetchUpcomingMovies fetchUpcomingMovies;

  List<Movie>? nowPlayingMovies;
  List<Movie>? popularMovies;
  List<Movie>? topRatedMovies;
  List<Movie>? upcomingMovies;
  bool isLoading = true;

  HomeViewModel({
    required this.fetchNowPlayingMovies,
    required this.fetchPopularMovies,
    required this.fetchTopRatedMovies,
    required this.fetchUpcomingMovies,
  });

  Future<void> fetchMovies() async {
    isLoading = true;
    notifyListeners();

    try {
      nowPlayingMovies = await fetchNowPlayingMovies();
      popularMovies = await fetchPopularMovies();
      topRatedMovies = await fetchTopRatedMovies();
      upcomingMovies = await fetchUpcomingMovies();
    } catch (e) {
      print("Error fetching movies: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
