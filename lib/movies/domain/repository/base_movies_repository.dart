import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/movie_show.dart';
import '../entities/tv_show.dart';
import '../entities/single_tv_show.dart';
import '../entities/single_movie.dart';
import '../usecases/get-single_movie_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<MovieShow>>> getMoviesShow();

  Future<Either<Failure, List<TvShow>>> getTvShow();

  Future<Either<Failure, SingleMovie>> getSingleMovie(
      MovieDetailsParameters parameters);

  Future<Either<Failure, SingleTvShow>> getSingleTvShow(
      MovieDetailsParameters parameters);
}
