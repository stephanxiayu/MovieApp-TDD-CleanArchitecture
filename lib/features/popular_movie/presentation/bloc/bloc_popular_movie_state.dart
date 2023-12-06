import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart';

abstract class PopularMovieState {}

class PopularMovieInitial extends PopularMovieState {}

class PopularMovieLoading extends PopularMovieState {}

class PopularMovieLoaded extends PopularMovieState {
  final List<MovieEntity> popularMovieEntity;

  PopularMovieLoaded(this.popularMovieEntity);
}

class PopularMovieError extends PopularMovieState {
  final String errorMessage;

  PopularMovieError(this.errorMessage);
}
