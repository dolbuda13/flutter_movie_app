class MovieDetailDto {
  /// 영화 ID
  final int id;

  /// 영화 제목
  final String title;

  /// 영화 줄거리
  final String overview;

  /// 개봉일
  final String releaseDate;

  /// 영화 상영 시간 (분 단위)
  final int? runtime;

  /// 평균 평점
  final double voteAverage;

  /// 총 투표 수
  final int voteCount;

  /// 인기 점수
  final double popularity;

  /// 영화 제작 예산
  final int? budget;

  /// 영화 수익
  final int? revenue;

  /// 영화의 태그라인 (짧은 홍보 문구)
  final String? tagline;

  /// 장르 이름 리스트
  final List<Map<String, dynamic>> genres;

  /// 제작사 로고 경로 리스트
  final List<Map<String, dynamic>> productionCompanies;

  MovieDetailDto({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.genres,
    required this.productionCompanies,
    this.runtime,
    this.budget,
    this.revenue,
    this.tagline,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return MovieDetailDto(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: (json['vote_count'] ?? 0).toInt(),
      popularity: (json['popularity'] ?? 0).toDouble(),
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
      productionCompanies: (json['production_companies'] as List<dynamic>?)
              ?.map((e) => Map<String, dynamic>.from(e as Map))
              .toList() ??
          [],
      runtime: (json['runtime'] as num?)?.toInt(),
      budget: (json['budget'] as num?)?.toInt(),
      revenue: (json['revenue'] as num?)?.toInt(),
      tagline: json['tagline'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'release_date': releaseDate,
      'runtime': runtime,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'popularity': popularity,
      'budget': budget,
      'revenue': revenue,
      'tagline': tagline,
      'genres': genres,
      'production_companies': productionCompanies,
    };
  }

  List<String> get genreNames =>
      genres.map((g) => g['name']?.toString() ?? '').toList();

  List<String?> get productionCompanyLogos =>
      productionCompanies.map((c) => c['logo_path']?.toString()).toList();
}
