import 'package:dio/dio.dart';
import 'package:finance_house_test/model/page_model.dart';
import 'package:finance_house_test/model/video_model.dart';

import '../model/movie_model.dart';
import 'dio/dio_settings.dart';

class ApiService {
  final DioSetting _dioSetting;

  ApiService(this._dioSetting);

  Future<dynamic> fetchPopularMovies({required int page}) async {
    final paginationData = {"page": page};
    final Response response = await _dioSetting.get(
        subUrl: '/movie/popular', queryParameters: paginationData);
    if (response.statusCode == 200) {
      final PageModel<MovieModel> page =
          PageModel<MovieModel>.fromJson(response.data);
      if (page.results != null) {
        page.results = (page.results as List)
            .map((json) => MovieModel.fromJson(json))
            .toList();
      }
      return page;
    }

    return response;
  }

  Future<dynamic> fetchTopRatedMovies({required int page}) async {
    final paginationData = {"page": page};
    final Response response = await _dioSetting.get(
        subUrl: '/movie/top_rated', queryParameters: paginationData);
    if (response.statusCode == 200) {
      final PageModel<MovieModel> page =
          PageModel<MovieModel>.fromJson(response.data);
      if (page.results != null) {
        page.results = (page.results as List)
            .map((json) => MovieModel.fromJson(json))
            .toList();
      }
      return page;
    }

    return response;
  }

  Future<dynamic> fetchNowPlayingMovies({required int page}) async {
    final paginationData = {"page": page};
    final Response response = await _dioSetting.get(
        subUrl: '/movie/now_playing', queryParameters: paginationData);
    if (response.statusCode == 200) {
      final PageModel<MovieModel> page =
          PageModel<MovieModel>.fromJson(response.data);
      if (page.results != null) {
        page.results = (page.results as List)
            .map((json) => MovieModel.fromJson(json))
            .toList();
      }
      return page;
    }

    return response;
  }

  Future<dynamic> searchMovies(String query, {required int page}) async {
    final paginationData = {"page": page, "title": query};
    final Response response = await _dioSetting.get(
        subUrl: '/movie/now_playing', queryParameters: paginationData);
    if (response.statusCode == 200) {
      final PageModel<MovieModel> page =
          PageModel<MovieModel>.fromJson(response.data);
      if (page.results != null) {
        page.results = (page.results as List)
            .map((json) => MovieModel.fromJson(json))
            .toList();
      }
      return page;
    }

    return response;
  }

  Future<dynamic> getMovieDetails(int movieId) async {
    final Response response = await _dioSetting.get(subUrl: '/movie/$movieId');
    if (response.statusCode == 200) {
      final PageModel<MovieModel> page =
          PageModel<MovieModel>.fromJson(response.data);
      if (page.results != null) {
        page.results = (page.results as List)
            .map((json) => MovieModel.fromJson(json))
            .toList();
      }
      return page;
    }

    return response;
  }

  Future<dynamic> getMovieVideos(int movieId) async {
    final response = await _dioSetting.get(subUrl: '/movie/$movieId/videos');
    if (response.statusCode == 200) {
      final VideoModel res = VideoModel.fromJson(response.data);
      return res;
    }

    return response;
  }
}
