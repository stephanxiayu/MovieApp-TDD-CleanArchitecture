import 'package:clean_movie/features/popular_movie/domian/usecases/get_popular_movies_usecase.dart';
import 'package:clean_movie/features/popular_movie/presentation/bloc/bloc_popular_movie_event.dart';
import 'package:clean_movie/features/popular_movie/presentation/bloc/bloc_popular_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovieBloc extends Bloc<PopularMovieEvent, PopularMovieState> {
  final GetPopularMovies getPopularMovies;

  PopularMovieBloc({required this.getPopularMovies})
      : super(PopularMovieInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMovieLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
          (failure) => emit(PopularMovieError(failure.toString())),
          (popularMovieEntity) => emit(PopularMovieLoaded(popularMovieEntity)));
    });
  }
}
