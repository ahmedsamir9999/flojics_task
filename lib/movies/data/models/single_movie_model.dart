import 'package:flojics_task/movies/data/models/related_movies_model.dart';

import '../../domain/entities/single_movie.dart';

class SingleMovieModel extends SingleMovie {
  const SingleMovieModel({
    required super.director,
    required super.title,
    required super.phase,
    required super.duration,
    required super.overview,
    required super.trailerUrl,
    required super.relatedMovies,
    required super.coverUrl,
  });

  factory SingleMovieModel.fromJson(Map<String, dynamic> json) =>
      SingleMovieModel(
        director: json["directed_by"],
        title: json["title"],
        phase: json["phase"],
        overview: json["overview"],
        duration: json["duration"],
        trailerUrl: json["trailer_url"],
        coverUrl: json["cover_url"],
        relatedMovies: List<RelatedMoviesModel>.from(
            json["related_movies"].map((x) => RelatedMoviesModel.fromJson(x))),
      );
}
