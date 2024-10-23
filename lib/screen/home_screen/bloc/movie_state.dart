part of 'movie_bloc.dart';

sealed class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class MovieInitial extends MovieState {}

class PopularMoviesLoading extends MovieState {}

class PopularMoviesLoaded extends MovieState {
  final PageModel<MovieModel> movies;

  PopularMoviesLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class TopRatedMoviesLoading extends MovieState {}

class TopRatedMoviesLoaded extends MovieState {
  final PageModel<MovieModel> movies;
  TopRatedMoviesLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class NowPlayingMoviesLoading extends MovieState {}

class NowPlayingMoviesLoaded extends MovieState {
  final PageModel<MovieModel> movies;
  NowPlayingMoviesLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MovieError extends MovieState {
  final String message;
  MovieError(this.message);

  @override
  List<Object?> get props => [message];
}
