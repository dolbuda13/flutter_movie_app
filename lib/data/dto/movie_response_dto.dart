class MovieResponseDto {
  final int page;
  final List<MovieDto>? results;

  MovieResponseDto({
    required this.page,
    required this.results,
  });

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) {
    return MovieResponseDto(
      page: json['page'] is int ? json['page'] : int.tryParse(json['page'].toString()) ?? 0,
      results: json['results'] != null
          ? (json['results'] as List)
              .map((item) => MovieDto.fromJson(item as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results?.map((movie) => movie.toJson()).toList(),
    };
  }
}

class MovieDto {
  final int id;
  final String title;
  final String posterPath;
  final double? popularity;
  final double? voteAverage;
  final int? voteCount;
  final String? overview;
  final String? releaseDate;

  MovieDto({
    required this.id,
    required this.title,
    required this.posterPath,
    this.popularity,
    this.voteAverage,
    this.voteCount,
    this.overview,
    this.releaseDate,
  });

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['id'] is int ? json['id'] : int.tryParse(json['id'].toString()) ?? 0,
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      popularity: json['popularity'] is double
          ? json['popularity']
          : double.tryParse(json['popularity']?.toString() ?? ''),
      voteAverage: json['vote_average'] is double
          ? json['vote_average']
          : double.tryParse(json['vote_average']?.toString() ?? ''),
      voteCount: json['vote_count'] is int
          ? json['vote_count']
          : int.tryParse(json['vote_count']?.toString() ?? ''),
      overview: json['overview'],
      releaseDate: json['release_date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'poster_path': posterPath,
      'popularity': popularity,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'overview': overview,
      'release_date': releaseDate,
    };
  }
}
