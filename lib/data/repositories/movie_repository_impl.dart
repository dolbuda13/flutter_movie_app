import 'package:flutter_movie_app/domain/entities/movie.dart';
import 'package:flutter_movie_app/domain/entities/movie_detail.dart';
import 'package:flutter_movie_app/domain/repositories/movie_repository.dart';
import 'package:flutter_movie_app/data/datasources/movie_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource movieDataSource;

  MovieRepositoryImpl({required this.movieDataSource});

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final response = await movieDataSource.fetchNowPlayingMovies();
    if (response == null || response.results == null) return null;

    return response.results!.map((dto) {
      return Movie(
        id: dto.id,
        posterPath: dto.posterPath,
      );
    }).toList();
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final response = await movieDataSource.fetchPopularMovies();
    if (response == null || response.results == null) return null;

    return response.results!.map((dto) {
      return Movie(
        id: dto.id,
        posterPath: dto.posterPath,
      );
    }).toList();
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final response = await movieDataSource.fetchTopRatedMovies();
    if (response == null || response.results == null) return null;

    return response.results!.map((dto) {
      return Movie(
        id: dto.id,
        posterPath: dto.posterPath,
      );
    }).toList();
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final response = await movieDataSource.fetchUpcomingMovies();
    if (response == null || response.results == null) return null;

    return response.results!.map((dto) {
      return Movie(
        id: dto.id,
        posterPath: dto.posterPath,
      );
    }).toList();
  }

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final dto = await movieDataSource.fetchMovieDetail(id);
    if (dto == null) return null;

    return MovieDetail(
      budget: dto.budget ?? 0,
      genres: dto.genres.map((genre) => genre['name'] as String).toList(),
      id: dto.id,
      productionCompanyLogos: dto.productionCompanies
          .map((company) => company['logo_path'] as String?)
          .where((logoPath) => logoPath != null)
          .cast<String>()
          .toList(),
      overview: dto.overview,
      popularity: dto.popularity,
      releaseDate: DateTime.parse(dto.releaseDate),
      revenue: dto.revenue ?? 0,
      runtime: dto.runtime ?? 0,
      tagline: dto.tagline ?? '',
      title: dto.title,
      voteAverage: dto.voteAverage,
      voteCount: dto.voteCount,
    );
  }
}
