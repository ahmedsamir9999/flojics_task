import 'package:dartz/dartz.dart';
import 'package:flojics_task/core/error/failure.dart';
import 'package:flojics_task/movies/domain/entities/tv_show.dart';
import 'package:flojics_task/movies/domain/entities/single_movie.dart';
import 'package:flojics_task/movies/domain/entities/single_tv_show.dart';
import 'package:flojics_task/movies/domain/usecases/get-single_movie_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../domain/entities/movie_show.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../datasource/movie_remote_data_source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<MovieShow>>> getMoviesShow() async {
    final result = await baseMovieRemoteDataSource.getMovieShow();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SingleMovie>> getSingleMovie(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getSingleMovie(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SingleTvShow>> getSingleTvShow(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getSingleTvShow(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvShow>>> getTvShow() async {
    final result = await baseMovieRemoteDataSource.getTvShow();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
