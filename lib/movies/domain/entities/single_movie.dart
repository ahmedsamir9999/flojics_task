import 'package:equatable/equatable.dart';

import 'tv_show.dart';

class SingleMovie extends Equatable {
  final String trailerUrl;
  final String coverUrl;
  final List<TvShow> relatedMovies;
  final int phase;
  final String overview;
  final String director;
  final int duration;
  final String title;

  const SingleMovie({
    required this.trailerUrl,
    required this.relatedMovies,
    required this.phase,
    required this.overview,
    required this.director,
    required this.duration,
    required this.title,
    required this.coverUrl,
  });

  @override
  List<Object> get props => [
        trailerUrl,
        relatedMovies,
        phase,
        overview,
        director,
        duration,
        title,
        coverUrl,
      ];
}
