import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie_show.dart';
import '../repository/base_movies_repository.dart';

class GetMoviesShowUseCase extends BaseUseCase<List<MovieShow>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMoviesShowUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<MovieShow>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getMoviesShow();
  }
}
