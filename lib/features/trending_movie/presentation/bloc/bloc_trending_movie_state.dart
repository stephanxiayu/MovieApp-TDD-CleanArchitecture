import 'package:clean_movie/features/trending_movie/domian/entities/movie_entity.dart';

abstract class TrendingMovieState {}

class TrendingMovieInitial extends TrendingMovieState {}

class TrendingMovieLoading extends TrendingMovieState {}

class TrendingMovieLoaded extends TrendingMovieState {
  final List<TrendingMovieEntity> trendingMovieEntity;

  TrendingMovieLoaded(this.trendingMovieEntity);
}

class TrendingMovieError extends TrendingMovieState {
  final String errorMessage;

  TrendingMovieError(this.errorMessage);
}
