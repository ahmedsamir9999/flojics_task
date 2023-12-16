import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/tv_show.dart';
import '../repository/base_movies_repository.dart';

class GetTvShowUseCase extends BaseUseCase<List<TvShow>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetTvShowUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<TvShow>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getTvShow();
  }
}
