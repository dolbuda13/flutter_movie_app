// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponseDto _$MovieResponseDtoFromJson(Map<String, dynamic> json) =>
    MovieResponseDto(
      page: (json['page'] as num).toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieResponseDtoToJson(MovieResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

MovieDto _$MovieDtoFromJson(Map<String, dynamic> json) => MovieDto(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: (json['voteCount'] as num).toInt(),
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$MovieDtoToJson(MovieDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'popularity': instance.popularity,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
    };
