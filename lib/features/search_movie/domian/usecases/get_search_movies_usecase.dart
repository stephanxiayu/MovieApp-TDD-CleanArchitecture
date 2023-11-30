


import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';
import 'package:clean_movie/features/search_movie/domian/repositories/search_movie_repository.dart';

class SearchMovies{
  final SearchMoviesRepository repository;

  SearchMovies( this.repository);

  Future<List<SearchMovieEntity>>call(String query)async{
    return await repository.searchMovies(query);
  }
}