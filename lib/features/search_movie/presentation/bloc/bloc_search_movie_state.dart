import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';

abstract class SearchMovieState {}

class SearchMovieInitial extends SearchMovieState {}

class SearchMovieLoading extends SearchMovieState {}

class SearchMovieLoaded extends SearchMovieState {
  final List<SearchMovieEntity> searchMovieEntity;

  SearchMovieLoaded(this.searchMovieEntity);
}

class SearchMovieError extends SearchMovieState {
  final String errorMessage;

  SearchMovieError(this.errorMessage);
}
