import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
import 'package:clean_movie/core/errors/server_failure/server_failure.dart';
import 'package:clean_movie/features/search_movie/data/datasources/search_movie_remote_data_sources.dart';
import 'package:clean_movie/features/search_movie/data/models/search_movie_model.dart';

import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';
import 'package:clean_movie/features/search_movie/domian/repositories/search_movie_repository.dart';
import 'package:dartz/dartz.dart';

class SearchMovieRepositoryImpl implements SearchMoviesRepository {
  final SearchMovieRemoteDataSource searchMovieRemoteDataSource;

  SearchMovieRepositoryImpl({required this.searchMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<SearchMovieEntity>>> searchMovies(
      String query) async {
    try {
      final List<SearchMovieModel> searchMovieModel =
          await searchMovieRemoteDataSource.searchMovies(query);
      final List<SearchMovieEntity> searchMovieEntity =
          searchMovieModel.map((model) => model.toSearchEntity()).toList();
      return Right(searchMovieEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
