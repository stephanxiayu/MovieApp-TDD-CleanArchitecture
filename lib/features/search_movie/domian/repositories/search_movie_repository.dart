


import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';

abstract class SearchMoviesRepository{

 Future<List<SearchMovieEntity>>  searchMovies(String query);

}