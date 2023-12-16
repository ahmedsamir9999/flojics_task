import 'package:flojics_task/movies/domain/entities/movie_show.dart';
import 'package:flojics_task/movies/domain/entities/single_movie.dart';
import 'package:flojics_task/movies/domain/entities/single_tv_show.dart';
import 'package:flojics_task/movies/domain/usecases/get_movies_show_UseCase.dart';
import 'package:flojics_task/movies/domain/usecases/get_single_tv_show_usecase.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../data/datasource/movie_remote_data_source.dart';
import '../../data/repository/movies_repository.dart';
import '../../domain/entities/tv_show.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get-single_movie_usecase.dart';
import '../../domain/usecases/get_tv_show_UseCase.dart';

class MovieProvider extends ChangeNotifier {
  List<TvShow>? tvShowList;

  List<MovieShow>? movieShowList;

  SingleTvShow? singleTv;

  SingleMovie? singleMovie;

  MovieProvider() {
    getTvData();
    getMovieData();
  }

  Future getTvData() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    BaseMoviesRepository moviesRepository =
        MoviesRepository(baseMovieRemoteDataSource);
    final result =
        await GetTvShowUseCase(moviesRepository).call(const NoParameters());
    result.fold((l) => null, (r) => tvShowList = r);
    notifyListeners();
  }

  Future getSingleTvData(int numOfSingleTv) async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    BaseMoviesRepository moviesRepository =
        MoviesRepository(baseMovieRemoteDataSource);
    final result = await GetSingleTvShowUseCase(moviesRepository)
        .call(MovieDetailsParameters(movieId: numOfSingleTv));
    result.fold((l) => null, (r) => singleTv = r);
    notifyListeners();
  }

  Future getMovieData() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    BaseMoviesRepository moviesRepository =
        MoviesRepository(baseMovieRemoteDataSource);
    final result =
        await GetMoviesShowUseCase(moviesRepository).call(const NoParameters());
    result.fold((l) => null, (r) => movieShowList = r);
    notifyListeners();
  }

  Future getSingleMovieData(int numOfSingleMovie) async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    BaseMoviesRepository moviesRepository =
        MoviesRepository(baseMovieRemoteDataSource);
    final result = await GetSingleMovieUseCase(moviesRepository)
        .call(MovieDetailsParameters(movieId: numOfSingleMovie));
    result.fold((l) => null, (r) => singleMovie = r);
    notifyListeners();
  }
}
