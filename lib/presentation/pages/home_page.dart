import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 20,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 가장 인기 있는 영화 섹션
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "가장 인기있는",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 280,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            // 현재 상영중 섹션
            const SectionHeaderWidget(title: '현재 상영중'),
            MovieListWidget(movieList: List.generate(20, (index) => '영화 $index')),
            // 인기순 섹션
            const SectionHeaderWidget(title: '인기순'),
            MovieListWidget(
              movieList: List.generate(
                20,
                (index) => '영화 $index',
              ),
            ),
            // 평점 높은순 섹션
            const SectionHeaderWidget(title: '평점 높은순'),
            MovieListWidget(
              movieList: List.generate(
                20,
                (index) => '영화 $index',
              ),
            ),
            // 개봉 예정 섹션
            const SectionHeaderWidget(title: '개봉 예정'),
            MovieListWidget(
              movieList: List.generate(
                20,
                (index) => '영화 $index',
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}

class SectionHeaderWidget extends StatelessWidget {
  final String title;

  const SectionHeaderWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class MovieListWidget extends StatelessWidget {
  final List<String> movieList;
  final bool showRank;

  const MovieListWidget({
    Key? key,
    required this.movieList,
    this.showRank = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}
