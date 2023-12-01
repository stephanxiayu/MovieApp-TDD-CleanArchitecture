class PopularMovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  PopularMovieModel(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath});

  factory PopularMovieModel.fromJson(Map<String, dynamic> json) {
    return PopularMovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['posterPath'],
    );
  }

Map<String, dynamic>toJson(){
  return {
    'id': id,
      'title': title,
      'overview': overview,
      'posterPath': posterPath
      };
}

}
