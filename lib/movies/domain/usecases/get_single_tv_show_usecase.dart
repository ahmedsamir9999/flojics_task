import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';

import '../entities/single_tv_show.dart';
import '../repository/base_movies_repository.dart';
import 'get-single_movie_usecase.dart';

class GetSingleTvShowUseCase
    extends BaseUseCase<SingleTvShow, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetSingleTvShowUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, SingleTvShow>> call(
      MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getSingleTvShow(parameters);
  }
}
