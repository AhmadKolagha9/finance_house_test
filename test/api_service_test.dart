import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'package:finance_house_test/data/api_service.dart';
import 'package:finance_house_test/model/movie_model.dart';
import 'package:finance_house_test/model/page_model.dart';
import 'mock_classes.mocks.dart';

void main() {
  late MockDioSetting mockDioSetting;
  late ApiService apiService;

  setUp(() {
    mockDioSetting = MockDioSetting();
    apiService = ApiService(mockDioSetting);
  });

  group('ApiService', () {
    test('returns PageModel<MovieModel> on success',
        () async {
      final mockResponse = Response(
        data: {
          'page': 1,
          'results': [
            {
              'id': 1,
              'title': 'Test Movie',
              'overview': 'Overview of the movie',
              'popularity': 123.45,
              'vote_average': 8.5,
            }
          ],
          'total_pages': 10,
          'total_results': 100,
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDioSetting.get(
              subUrl: anyNamed('subUrl'),
              queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => mockResponse);

      final result = await apiService.fetchPopularMovies(page: 1);

      expect(result, isA<PageModel<MovieModel>>());
      expect(
          (result as PageModel<MovieModel>).results?.first.title, 'Test Movie');
    });

    test('returns PageModel<MovieModel> on success',
        () async {
      final mockResponse = Response(
        data: {
          'page': 1,
          'results': [
            {
              'id': 2,
              'title': 'Top Rated Movie',
              'overview': 'Top rated movie overview',
              'popularity': 200.00,
              'vote_average': 9.0,
            }
          ],
          'total_pages': 5,
          'total_results': 50,
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDioSetting.get(
              subUrl: anyNamed('subUrl'),
              queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => mockResponse);

      final result = await apiService.fetchTopRatedMovies(page: 1);

      expect(result, isA<PageModel<MovieModel>>());
      expect((result as PageModel<MovieModel>).results?.first.title,
          'Top Rated Movie');
    });

    test('returns PageModel<MovieModel> on success',
        () async {
      final mockResponse = Response(
        data: {
          'page': 1,
          'results': [
            {
              'id': 3,
              'title': 'Now Playing Movie',
              'overview': 'Now playing movie overview',
              'popularity': 150.00,
              'vote_average': 7.5,
            }
          ],
          'total_pages': 3,
          'total_results': 30,
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDioSetting.get(
              subUrl: anyNamed('subUrl'),
              queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => mockResponse);

      final result = await apiService.fetchNowPlayingMovies(page: 1);

      expect(result, isA<PageModel<MovieModel>>());
      expect((result as PageModel<MovieModel>).results?.first.title,
          'Now Playing Movie');
    });

    test('returns PageModel<MovieModel> on success', () async {
      final mockResponse = Response(
        data: {
          'page': 1,
          'results': [
            {
              'id': 4,
              'title': 'Searched Movie',
              'overview': 'Searched movie overview',
              'popularity': 120.00,
              'vote_average': 6.5,
            }
          ],
          'total_pages': 2,
          'total_results': 20,
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDioSetting.get(
              subUrl: anyNamed('subUrl'),
              queryParameters: anyNamed('queryParameters')))
          .thenAnswer((_) async => mockResponse);

      final result = await apiService.searchMovies("Searched Movie", page: 1);

      expect(result, isA<PageModel<MovieModel>>());
      expect((result as PageModel<MovieModel>).results?.first.title,
          'Searched Movie');
    });

    test('returns MovieModel on success', () async {
      final mockResponse = Response(
        data: {
          'id': 1,
          'title': 'Test Movie1',
          'overview': 'Test movie overview',
          'popularity': 13.45,
          'vote_average': 8.5,
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDioSetting.get(subUrl: anyNamed('subUrl')))
          .thenAnswer((_) async => mockResponse);

      final result = await apiService.getMovieDetails(1);

      expect(result, isA<MovieModel>());
      expect((result as MovieModel).title, 'Test Movie');
    });
  });
}
