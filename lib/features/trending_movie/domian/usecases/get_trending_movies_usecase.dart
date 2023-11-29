
import 'package:clean_movie/features/trending_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/features/trending_movie/domian/repositories/movie_repository.dart';



class GetTrendingMovies{
  final TrendingMovieRepository repository;

  GetTrendingMovies( this.repository);

  Future<List<TrendingMovieEntity>>call()async{
    return await repository.getTrendingMovies();
  }
}