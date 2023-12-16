import '../../domain/entities/movie_show.dart';

class MoviesModel extends MovieShow {
  const MoviesModel({
    required super.title,
    required super.id,
    required super.imageUrl,
    required super.director,
    required super.releaseDate,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        id: json["id"],
        title: json["title"],
        imageUrl: json["cover_url"],
        director: json["directed_by"],
        releaseDate: json["release_date"],
      );
}
