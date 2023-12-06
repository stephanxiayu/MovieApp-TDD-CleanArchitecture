import 'package:clean_movie/features/search_movie/domian/usecases/get_search_movies_usecase.dart';
import 'package:clean_movie/features/search_movie/presentation/bloc/bloc_search_movie_event.dart';
import 'package:clean_movie/features/search_movie/presentation/bloc/bloc_search_movie_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc({
    required this.searchMovies,
  }) : super(SearchMovieInitial()) {
    on<FetchSearchMovies>((event, emit) async {
      emit(SearchMovieLoading());
      final failureOrMovies = await searchMovies(event.query);
      failureOrMovies.fold(
          (failure) => emit(SearchMovieError(failure.toString())),
          (trendingMovieEntity) =>
              emit(SearchMovieLoaded(trendingMovieEntity)));
    });
  }
}
