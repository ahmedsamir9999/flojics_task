import 'package:equatable/equatable.dart';

class MovieShow extends Equatable {
  final String title;
  final String imageUrl;
  final String director;
  final String releaseDate;
  final int id;

  const MovieShow({
    required this.title,
    required this.imageUrl,
    required this.id,
    required this.director,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [title, imageUrl,id,director,releaseDate];
}
