import 'api_service.dart';

class MovieRepository {
  final ApiService apiService;

  MovieRepository(this.apiService);

  Future<dynamic> fetchPopularMovies({required int page}) =>
      apiService.fetchPopularMovies(page: page);

  Future<dynamic> fetchTopRatedMovies({required int page}) =>
      apiService.fetchTopRatedMovies(page: page);

  Future<dynamic> fetchNowPlayingMovies({required int page}) =>
      apiService.fetchNowPlayingMovies(page: page);

  Future<dynamic> searchMovies(String query, {required int page}) =>
      apiService.searchMovies(query, page: page);

  Future<dynamic> getMovieDetails(int movieId) =>
      apiService.getMovieDetails(movieId);
}
