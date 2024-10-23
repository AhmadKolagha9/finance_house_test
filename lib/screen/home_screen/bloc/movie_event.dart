part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();
}

class FetchPopularMovies extends MovieEvent {
  final int page;

  const FetchPopularMovies(this.page);

  @override
  List<Object?> get props => [page];
}

class FetchTopRatedMovies extends MovieEvent {
  final int page;

  const FetchTopRatedMovies(this.page);

  @override
  List<Object?> get props => [page];
}

class FetchNowPlayingMovies extends MovieEvent {
  final int page;

  const FetchNowPlayingMovies(this.page);

  @override
  List<Object?> get props => [page];
}

class SearchMovies extends MovieEvent {
  final String query;
  final int page;

  const SearchMovies(this.query, this.page);

  @override
  List<Object?> get props => [query, page];
}
