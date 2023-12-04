import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
import 'package:clean_movie/core/errors/server_failure/server_failure.dart';
import 'package:clean_movie/features/trending_movie/data/datasources/trending_movie_remote_data_sources.dart';
import 'package:clean_movie/features/trending_movie/data/models/trending_movie_model.dart';
import 'package:clean_movie/features/trending_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/features/trending_movie/domian/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class TrendingMovieRepositoryImpl implements TrendingMovieRepository {
  final TrendingMovieRemoteDataSource trendingMovieRemoteDataSource;

  TrendingMovieRepositoryImpl({required this.trendingMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<TrendingMovieEntity>>> getTrendingMovies() async {
    try {
      final List<TrendingMovieModel> trendingMovieModel =
          await trendingMovieRemoteDataSource.getTrendingMovie();
      final List<TrendingMovieEntity> trendingMovieEntity =
          trendingMovieModel.map((model) => model.toTrendingEntity()).toList();
      return Right(trendingMovieEntity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
