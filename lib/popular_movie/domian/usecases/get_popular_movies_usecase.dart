


import 'package:clean_movie/popular_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/popular_movie/domian/repositories/movie_repository.dart';

class GetPopularMovies{
  final MovieRepository repository;

  GetPopularMovies( this.repository);

  Future<List<MovieEntity>>call()async{
    return await repository.getPopularMovies();
  }
}