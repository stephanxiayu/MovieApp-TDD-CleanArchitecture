class SearchMovieEntity {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  SearchMovieEntity(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath});
}
