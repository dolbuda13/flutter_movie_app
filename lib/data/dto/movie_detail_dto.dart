import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_dto.g.dart';

@JsonSerializable()
class MovieDetailDto {
  /// 영화 ID
  final int id;

  /// 영화 제목
  final String title;

  /// 영화 줄거리
  final String overview;

  /// 개봉일
  @JsonKey(name: "release_date")
  final String releaseDate;

  /// 영화 상영 시간 (분 단위)
  @JsonKey(name: "runtime")
  final int? runtime;

  /// 평균 평점
  @JsonKey(name: "vote_average")
  final double voteAverage;

  /// 총 투표 수
  @JsonKey(name: "vote_count")
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
  @JsonKey(name: "genres")
  final List<Map<String, dynamic>> genres;

  /// 제작사 로고 경로 리스트
  @JsonKey(name: "production_companies")
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

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailDtoToJson(this);

  List<String> get genreNames => genres.map((g) => g['name'] as String).toList();

  List<String?> get productionCompanyLogos =>
      productionCompanies.map((c) => c['logo_path'] as String?).toList();
}
