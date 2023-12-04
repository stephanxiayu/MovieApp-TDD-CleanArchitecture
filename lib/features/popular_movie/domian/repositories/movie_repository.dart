import 'package:clean_movie/core/errors/server_failure/server_failure.dart';
import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies();
}
