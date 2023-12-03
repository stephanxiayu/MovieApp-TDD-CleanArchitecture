import 'package:clean_movie/features/search_movie/data/datasources/search_movie_remote_data_sources.dart';

import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';
import 'package:clean_movie/features/search_movie/domian/repositories/search_movie_repository.dart';

class SearchMovieRepositoryImpl implements SearchMoviesRepository{
  final SearchMovieRemoteDataSource searchMovieRemoteDataSource;

  SearchMovieRepositoryImpl({required this.searchMovieRemoteDataSource});

  @override
  Future<List<SearchMovieEntity>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }

}