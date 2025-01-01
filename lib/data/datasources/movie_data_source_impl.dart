import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_app/data/dto/movie_response_dto.dart';
import 'package:flutter_movie_app/data/datasources/movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final Dio _dio = Dio();
  final String _apiKey = dotenv.env['API_KEY'] ?? '';

  // 현재 상영중 영화 가져오기
  @override
  Future<MovieResponseDto?> fetchNowPlayingMovies() async {
    return _fetchMovieList(
        'https://api.themoviedb.org/3/movie/now_playing');
  }

  // 인기순 영화 가져오기
  @override
  Future<MovieResponseDto?> fetchPopularMovies() async {
    return _fetchMovieList(
        'https://api.themoviedb.org/3/movie/popular');
  }

  // 평점 높은순 영화 가져오기
  @override
  Future<MovieResponseDto?> fetchTopRatedMovies() async {
    return _fetchMovieList(
        'https://api.themoviedb.org/3/movie/top_rated');
  }

  // 개봉 예정 영화 가져오기
  @override
  Future<MovieResponseDto?> fetchUpcomingMovies() async {
    return _fetchMovieList(
        'https://api.themoviedb.org/3/movie/upcoming');
  }

  // 영화 상세 정보 가져오기
  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/$id',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'ko-KR',
        },
      );
      if (response.statusCode == 200) {
        return MovieDetailDto.fromJson(response.data);
      }
    } catch (e) {
      print('Error fetching movie detail: $e');
    }
    return null;
  }

  // 공통적인 영화 목록 API 호출 처리
  Future<MovieResponseDto?> _fetchMovieList(String url) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: {
          'api_key': _apiKey,
          'language': 'ko-KR',
          'page': 1,
        },
      );
      if (response.statusCode == 200) {
        return MovieResponseDto.fromJson(response.data);
      }
    } catch (e) {
      print('Error fetching movie list: $e');
    }
    return null;
  }
}
