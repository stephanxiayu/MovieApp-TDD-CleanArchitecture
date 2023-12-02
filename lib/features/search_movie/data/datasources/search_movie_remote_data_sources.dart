


import 'package:clean_movie/features/search_movie/data/models/search_movie_model.dart';

abstract class SearchgMovieRemoteDataSource{

  Future<List<SearchMovieModel>>  searchMovies(String query);
  
}