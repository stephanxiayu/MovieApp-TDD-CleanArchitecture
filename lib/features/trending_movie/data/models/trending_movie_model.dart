class TrendingMovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  TrendingMovieModel(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterPath});

  factory TrendingMovieModel.fromJson(Map<String, dynamic> json) {
    return TrendingMovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['posterPath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'posterPath': posterPath
    };
  }
}
