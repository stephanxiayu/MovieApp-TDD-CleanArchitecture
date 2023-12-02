
import 'package:clean_movie/features/trending_movie/data/models/trending_movie_model.dart';

abstract class TrendingMovieRemoteDataSource{

  Future<List<TrendingMovieModel>>  getTrendingMovie();
  
}