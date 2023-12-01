import 'package:clean_movie/features/popular_movie/data/models/popular_movie_model.dart';

abstract class PopularMovieRemoteDataSource{

  Future<List<PopularMovieModel>>  getPopularMovies();
  
}