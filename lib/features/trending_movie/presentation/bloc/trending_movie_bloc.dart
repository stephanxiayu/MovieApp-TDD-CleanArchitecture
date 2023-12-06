import 'package:clean_movie/features/trending_movie/domian/usecases/get_trending_movies_usecase.dart';
import 'package:clean_movie/features/trending_movie/presentation/bloc/bloc_trending_movie_event.dart';
import 'package:clean_movie/features/trending_movie/presentation/bloc/bloc_trending_movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  final GetTrendingMovies getTrendingMovies;

  TrendingMovieBloc({required this.getTrendingMovies})
      : super(TrendingMovieInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMovieLoading());
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold(
          (failure) => emit(TrendingMovieError(failure.toString())),
          (trendingMovieEntity) =>
              emit(TrendingMovieLoaded(trendingMovieEntity)));
    });
  }
}
