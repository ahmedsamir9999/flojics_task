import '../../domain/entities/single_tv_show.dart';

class SingleTvModel extends SingleTvShow {
  const SingleTvModel({
    required super.director,
    required super.trailerUrl,
    required super.episodes,
    required super.phase,
    required super.overview,
    required super.season,
    required super.title,
    required super.coverUrl,
  });

  factory SingleTvModel.fromJson(Map<String, dynamic> json) => SingleTvModel(
        director: json["directed_by"],
        episodes: json["number_episodes"],
        overview: json["overview"],
        phase: json["phase"],
        season: json["season"],
        title: json["title"],
        trailerUrl: json["trailer_url"],
        coverUrl: json["cover_url"],
      );
}
