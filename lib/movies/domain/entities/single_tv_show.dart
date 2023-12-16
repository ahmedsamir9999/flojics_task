import 'package:equatable/equatable.dart';

class SingleTvShow extends Equatable {
  final int season;
  final String title;
  final String trailerUrl;
  final String coverUrl;
  final String director;
  final String overview;
  final int episodes;
  final int phase;

  const SingleTvShow({
    required this.season,
    required this.trailerUrl,
    required this.title,
    required this.director,
    required this.overview,
    required this.episodes,
    required this.phase,
    required this.coverUrl,
  });

  @override
  List<Object> get props => [
        season,
        title,
        director,
        overview,
        episodes,
        trailerUrl,
        phase,
        coverUrl,
      ];
}
