import 'package:clean_movie/core/errors/server_failure/server_failure.dart';
import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchMoviesRepository {
  Future<Either<Failure, List<SearchMovieEntity>>> searchMovies(String query);
}
