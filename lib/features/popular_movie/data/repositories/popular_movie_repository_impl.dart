import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
import 'package:clean_movie/core/errors/server_failure/server_failure.dart';
import 'package:clean_movie/features/popular_movie/data/datasources/popular_movie_remote_data_sources.dart';
import 'package:clean_movie/features/popular_movie/data/models/popular_movie_model.dart';
import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/features/popular_movie/domian/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class PopularMovieRepositoryImpl implements MovieRepository {
  final PopularMovieRemoteDataSource popularMovieRemoteDataSource;

  PopularMovieRepositoryImpl({required this.popularMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies() async {
    try {
      final List<PopularMovieModel> popularMovieModel =
          await popularMovieRemoteDataSource.getPopularMovies();
      final List<MovieEntity> movieEntity =
          popularMovieModel.map((model) => model.toEntity()).toList();
      return Right(movieEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
