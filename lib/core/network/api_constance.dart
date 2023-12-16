class ApiConstance {
  static const String baseUrlMovies = "https://mcuapi.herokuapp.com/api/v1/movies";
  static const String baseUrlTvShow = "https://mcuapi.herokuapp.com/api/v1/tvshows";

  static String singleMoviePath(int movieId) =>
      "$baseUrlMovies/$movieId";

  static String singleTvShowPath(int movieId) =>
      "$baseUrlTvShow/$movieId";

}
