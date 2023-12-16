import '../../domain/entities/tv_show.dart';

class RelatedMoviesModel extends TvShow {
  const RelatedMoviesModel({
    required super.title,
    required super.id,
    required super.imageUrl,
  });

  factory RelatedMoviesModel.fromJson(Map<String, dynamic> json) =>
      RelatedMoviesModel(
        id: json["id"],
        title: json["title"],
        imageUrl: json["cover_url"],
      );
}
