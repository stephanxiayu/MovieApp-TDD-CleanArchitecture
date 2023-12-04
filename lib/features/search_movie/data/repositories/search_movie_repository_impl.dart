import 'package:clean_movie/features/search_movie/data/datasources/search_movie_remote_data_sources.dart';
import 'package:clean_movie/features/search_movie/data/models/search_movie_model.dart';

import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';
import 'package:clean_movie/features/search_movie/domian/repositories/search_movie_repository.dart';

class SearchMovieRepositoryImpl implements SearchMoviesRepository{
  final SearchMovieRemoteDataSource searchMovieRemoteDataSource;

  SearchMovieRepositoryImpl({required this.searchMovieRemoteDataSource});

  @override
  Future<List<SearchMovieEntity>> searchMovies(String query)async {
    final List <SearchMovieModel> searchMovieModel= await searchMovieRemoteDataSource.searchMovies(query);
    final List<SearchMovieEntity> searchMovieEntity =searchMovieModel.map((model) => model.toSearchEntity()).toList();
    return searchMovieEntity;
  }

}