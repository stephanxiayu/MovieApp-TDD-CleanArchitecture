import 'package:clean_movie/core/errors/server_failure/server_failure.dart';
import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/features/popular_movie/domian/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<Either<Failure, List<MovieEntity>>> call() async {
    return await repository.getPopularMovies();
  }
}
