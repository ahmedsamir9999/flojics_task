import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/single_movie.dart';
import '../repository/base_movies_repository.dart';

class GetSingleMovieUseCase
    extends BaseUseCase<SingleMovie, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetSingleMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, SingleMovie>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getSingleMovie(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
