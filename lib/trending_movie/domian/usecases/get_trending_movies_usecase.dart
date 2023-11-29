
import 'package:clean_movie/trending_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/trending_movie/domian/repositories/movie_repository.dart';

class GetTrendingMovies{
  final MovieRepository repository;

  GetTrendingMovies( this.repository);

  Future<List<MovieEntity>>call()async{
    return await repository.getTrendingMovies();
  }
}