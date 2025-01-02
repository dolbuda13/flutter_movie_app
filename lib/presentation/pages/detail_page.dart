import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_movie_app/domain/entities/movie_detail.dart';
import 'package:flutter_movie_app/presentation/providers.dart';

class DetailPage extends ConsumerWidget {
  final int movieId;
  final String posterPath;

  const DetailPage({Key? key, required this.movieId, required this.posterPath}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetailAsyncValue = ref.watch(movieDetailProvider(movieId));

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: movieDetailAsyncValue.when(
        data: (movieDetail) {
          if (movieDetail == null) {
            return const Center(
              child: Text(
                "영화 정보를 가져올 수 없습니다.",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return _buildDetailContent(context, movieDetail);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            "오류 발생: $error",
            style: const TextStyle(color: Colors.white),
        ),
        ),
      ),
    );
  }

  Widget _buildDetailContent(BuildContext context, MovieDetail movieDetail) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "movie_${movieDetail.id}",
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500$posterPath'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    movieDetail.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              children: movieDetail.genres.map((genre) => GenreChip(genre: genre)).toList(),
            ),
          ),
          const SizedBox(height: 16),
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
