import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/movie_repository.dart';
import '../../../model/movie_model.dart';
import '../../../model/page_model.dart';

part 'movie_event.dart';

part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      try {
        final movies =
            await movieRepository.fetchPopularMovies(page: event.page);
        emit(PopularMoviesLoaded(movies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });

    on<FetchTopRatedMovies>((event, emit) async {
      emit(TopRatedMoviesLoading());
      try {
        final movies =
            await movieRepository.fetchTopRatedMovies(page: event.page);
        emit(TopRatedMoviesLoaded(movies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });

    on<FetchNowPlayingMovies>((event, emit) async {
      emit(NowPlayingMoviesLoading());
      try {
        final movies =
            await movieRepository.fetchNowPlayingMovies(page: event.page);
        emit(NowPlayingMoviesLoaded(movies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });

    on<SearchMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      try {
        final movies =
            await movieRepository.searchMovies(event.query, page: event.page);
        emit(PopularMoviesLoaded(movies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });
  }
}
