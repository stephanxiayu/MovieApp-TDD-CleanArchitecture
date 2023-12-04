import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';

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
  SearchMovieEntity toSearchEntity() {
    return SearchMovieEntity(
        id: id,
         overview: overview, 
         title: title, 
         posterPath: posterPath
         );
  }
}
