import 'package:cinema_hub/features/home/domain/entities/home_entity.dart';
import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;
  final String? backdropPath;
  final List<int>? genreIds;
  final String? overview;
  final String? releaseDate;

  const MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.voteAverage,
    this.backdropPath,
    this.genreIds,
    this.overview,
    this.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        posterPath: json['poster_path'] ?? '',
        voteAverage: (json['vote_average'] as num).toDouble(),
        backdropPath: json['backdrop_path'],
        genreIds: (json['genre_ids'] as List<dynamic>?)?.cast<int>(),
        overview: json['overview'],
        releaseDate: json['release_date'],
      );

  HomeEntity toEntity() => HomeEntity(
        id: id,
        title: title,
        posterPath: posterPath,
        voteAverage: voteAverage,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        posterPath,
        voteAverage,
        backdropPath,
        genreIds,
        overview,
        releaseDate,
      ];
}
