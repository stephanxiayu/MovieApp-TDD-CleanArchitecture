



import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart';

abstract class MovieRepository{


 Future<List<MovieEntity>>  getPopularMovies();
}