
import 'package:clean_movie/features/popular_movie/data/datasources/popular_movie_remote_data_sources.dart';
import 'package:clean_movie/features/popular_movie/data/models/popular_movie_model.dart';
import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/features/popular_movie/domian/repositories/movie_repository.dart';

class PopularMovieRepositoryImpl implements MovieRepository{
  final PopularMovieRemoteDataSource popularMovieRemoteDataSource;

  PopularMovieRepositoryImpl({required this.popularMovieRemoteDataSource});

  @override
  Future<List<MovieEntity>> getPopularMovies()async {
    final List <PopularMovieModel> popularMovieModel= await popularMovieRemoteDataSource.getPopularMovies();
    final List<MovieEntity> movieEntity =popularMovieModel.map((model) => model.toEntity()).toList();
    return movieEntity;

  }
  


}