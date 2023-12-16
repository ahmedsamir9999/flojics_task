import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get-single_movie_usecase.dart';
import '../models/movies_model.dart';
import '../models/single_movie_model.dart';
import '../models/single_tv_model.dart';
import '../models/tv_show_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MoviesModel>> getMovieShow();

  Future<List<TvShowModel>> getTvShow();

  Future<SingleTvModel> getSingleTvShow(MovieDetailsParameters parameters);

  Future<SingleMovieModel> getSingleMovie(MovieDetailsParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MoviesModel>> getMovieShow() async {
    final response = await Dio().get(ApiConstance.baseUrlMovies);
    if (response.statusCode == 200) {
      return List<MoviesModel>.from((response.data['data']).map(
        (e) => MoviesModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<TvShowModel>> getTvShow() async {
    final response = await Dio().get(ApiConstance.baseUrlTvShow);

    if (response.statusCode == 200) {
      return List<TvShowModel>.from((response.data['data'] as List).map(
        (e) => TvShowModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SingleTvModel> getSingleTvShow(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.singleTvShowPath(parameters.movieId));

    if (response.statusCode == 200) {
      return SingleTvModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<SingleMovieModel> getSingleMovie(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.singleMoviePath(parameters.movieId));

    if (response.statusCode == 200) {
      return SingleMovieModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
