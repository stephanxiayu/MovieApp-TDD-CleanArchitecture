
import 'package:clean_movie/features/popular_movie/data/datasources/popular_movie_remote_data_sources.dart';
import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/features/popular_movie/domian/repositories/movie_repository.dart';

class PopularMovieRepositoryImpl implements MovieRepository{
  final PopularMovieRemoteDataSource popularMovieRemoteDataSource;

  PopularMovieRepositoryImpl({required this.popularMovieRemoteDataSource});

  @override
  Future<List<MovieEntity>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }
  


}