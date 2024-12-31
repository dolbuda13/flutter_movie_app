import 'package:json_annotation/json_annotation.dart';

part 'movie_response_dto.g.dart';

@JsonSerializable()
class MovieResponseDto {
  final int page;
  final List<MovieDto>? results;

  MovieResponseDto({
    required this.page,
    required this.results,
  });

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseDtoToJson(this);
}

@JsonSerializable()
class MovieDto {
  final int id;
  final String title;
  @JsonKey(name: "poster_path")
  final String posterPath;
  final double popularity;
  final double voteAverage;
  final int voteCount;
  final String overview;
  @JsonKey(name: "release_date")
  final String? releaseDate;

  MovieDto({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.overview,
    this.releaseDate,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) =>
      _$MovieDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDtoToJson(this);
}
