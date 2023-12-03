import 'package:clean_movie/features/trending_movie/data/datasources/trending_movie_remote_data_sources.dart';
import 'package:clean_movie/features/trending_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/features/trending_movie/domian/repositories/movie_repository.dart';

class TrendingMovieRepositoryImpl implements TrendingMovieRepository{
  final TrendingMovieRemoteDataSource trendingMovieRemoteDataSource;

  TrendingMovieRepositoryImpl({required this.trendingMovieRemoteDataSource});
  
  @override
  Future<List<TrendingMovieEntity>> getTrendingMovies() {
    // TODO: implement getTrendingMovies
    throw UnimplementedError();
  }

}