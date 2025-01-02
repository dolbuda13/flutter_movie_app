import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/presentation/viewmodels/home_view_model.dart';
import 'package:flutter_movie_app/domain/entities/movie.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);

    if (homeState == null) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 가장 인기 있는 영화 섹션
            buildFeaturedMovie(context, homeState.popularMovies),
            const SizedBox(height: 10),
            // 현재 상영중 섹션
            buildMovieSection(context, '현재 상영중', homeState.nowPlayingMovies),
            const SizedBox(height: 10),
            // 인기순 섹션
            buildMovieSection(context, '인기순', homeState.popularMovies, showRanking: true),
            const SizedBox(height: 10),
            // 평점 높은순 섹션
            buildMovieSection(context, '평점 높은순', homeState.topRatedMovies),
            const SizedBox(height: 10),
            // 개봉예정 섹션
            buildMovieSection(context, '개봉예정', homeState.upcomingMovies),
          ],
        ),
      ),
    );
  }

  // 가장 인기 있는 영화 섹션
  Widget buildFeaturedMovie(BuildContext context, List<Movie> movies) {
    if (movies.isEmpty) {
      return Container(
        height: 350,
        color: Colors.grey[800],
        alignment: Alignment.center,
        child: const Text(
          '영화를 불러올 수 없습니다.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    final movie = movies[0]; // 첫 번째 인기 영화를 선택
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // "가장 인기있는" 텍스트
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            '가장 인기있는',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // 포스터 이미지
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  // 영화 리스트 섹션 빌더
  Widget buildMovieSection(BuildContext context, String title, List<Movie> movies,
      {bool showRanking = false}) {
    if (movies.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          '$title 영화를 불러올 수 없습니다.',
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: {
                        'id': movie.id,
                        'posterPath': movie.posterPath,
                      },
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      if (showRanking)
                        Positioned(
                          bottom: 5,
                          left: 5,
                          child: Container(
                            padding: const EdgeInsets.all(4.0),
                            color: Colors.black54,
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
