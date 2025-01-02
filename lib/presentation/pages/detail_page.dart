import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entities/movie_detail.dart';

class DetailPage extends StatelessWidget {
  final MovieDetail movieDetail;

  const DetailPage({Key? key, required this.movieDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 영화 이미지 (Hero 애니메이션 적용)
            Hero(
              tag: "movie_${movieDetail.id}",
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://image.tmdb.org/t/p/w500${movieDetail.productionCompanyLogos.isNotEmpty ? movieDetail.productionCompanyLogos.first : ''}'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 영화 제목, 개봉일
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movieDetail.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    movieDetail.releaseDate.toLocal().toString().split(' ')[0],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // 태그라인
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                movieDetail.tagline,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 러닝타임 및 카테고리
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 8.0,
                children: movieDetail.genres.map((genre) => GenreChip(genre: genre)).toList(),
              ),
            ),
            const SizedBox(height: 16),
            // 영화 설명
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                movieDetail.overview,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // 흥행정보 섹션 제목
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "흥행정보",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // 흥행정보 가로 리스트뷰
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  InfoBox(title: "평점", value: movieDetail.voteAverage.toStringAsFixed(1)),
                  InfoBox(title: "평점투표수", value: movieDetail.voteCount.toString()),
                  InfoBox(title: "인기점수", value: movieDetail.popularity.toStringAsFixed(1)),
                  InfoBox(title: "예산", value: "\$${movieDetail.budget}"),
                  InfoBox(title: "수익", value: "\$${movieDetail.revenue}"),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // 제작사 섹션
            Container(
              color: Colors.white.withOpacity(0.1),
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: movieDetail.productionCompanyLogos.map((logo) => ProductionLogo(logoPath: logo)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  final String genre;

  const GenreChip({Key? key, required this.genre}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        genre,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}

class InfoBox extends StatelessWidget {
  final String title;
  final String value;

  const InfoBox({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      padding: const EdgeInsets.all(8.0),
      width: 120,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductionLogo extends StatelessWidget {
  final String? logoPath;

  const ProductionLogo({Key? key, this.logoPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        image: logoPath != null
            ? DecorationImage(
                image: NetworkImage('https://image.tmdb.org/t/p/w500$logoPath'),
                fit: BoxFit.cover,
              )
            : null,
      ),
    );
  }
}
