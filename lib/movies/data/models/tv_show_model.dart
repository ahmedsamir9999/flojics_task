

import '../../domain/entities/tv_show.dart';

class TvShowModel extends TvShow {
  const TvShowModel({
    required super.title,
    required super.id,
    required super.imageUrl,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) => TvShowModel(
        id: json["id"],
        title: json["title"],
        imageUrl: json["cover_url"],
      );
}
