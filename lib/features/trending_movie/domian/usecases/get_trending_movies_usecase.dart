import 'package:clean_movie/core/errors/server_failure/server_failure.dart';
import 'package:clean_movie/features/trending_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/features/trending_movie/domian/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetTrendingMovies {
  final TrendingMovieRepository repository;

  GetTrendingMovies(this.repository);

  Future<Either<Failure, List<TrendingMovieEntity>>> call() async {
    return await repository.getTrendingMovies();
  }
}
