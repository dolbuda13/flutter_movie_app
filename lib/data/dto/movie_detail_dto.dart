import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_dto.g.dart';

@JsonSerializable()
class MovieDetailDto {
  final int id;
  final String title;
  final String overview;
  @JsonKey(name: "release_date")
  final String releaseDate;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "vote_count")
  final int voteCount;
  @JsonKey(name: "popularity")
  final double popularity;
  final int? budget;
  final int? revenue;

  MovieDetailDto({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    this.runtime,
    this.budget,
    this.revenue,
  });

  factory MovieDetailDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailDtoToJson(this);
}
