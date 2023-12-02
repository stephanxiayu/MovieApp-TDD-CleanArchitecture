class SearchMovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  SearchMovieModel(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath});

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) {
    return SearchMovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }

Map<String, dynamic>toJson(){
  return {
    'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterPath
      };
}

}
