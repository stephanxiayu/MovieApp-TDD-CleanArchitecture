abstract class SearchMovieEvent {}

class FetchSearchMovies extends SearchMovieEvent {
  final String query;

  FetchSearchMovies(this.query);
}
