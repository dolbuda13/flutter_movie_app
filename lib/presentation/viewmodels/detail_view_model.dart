import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entities/movie_detail.dart';
import 'package:flutter_movie_app/domain/usecases/fetch_movie_detail.dart';

class DetailViewModel extends ChangeNotifier {
  final FetchMovieDetail fetchMovieDetail;

  MovieDetail? movieDetail;
  bool isLoading = true;

  DetailViewModel({
    required this.fetchMovieDetail,
  });

  Future<void> fetchDetail(int movieId) async {
    isLoading = true;
    notifyListeners();

    try {
      movieDetail = await fetchMovieDetail(movieId);
    } catch (e) {
      print("Error fetching movie detail: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
