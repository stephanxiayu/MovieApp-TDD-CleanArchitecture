import 'package:clean_movie/features/popular_movie/data/datasources/popular_movie_remote_data_sources.dart';
import 'package:clean_movie/features/popular_movie/data/datasources/popular_movie_remote_data_sources_impl.dart';
import 'package:clean_movie/features/popular_movie/data/repositories/popular_movie_repository_impl.dart';
import 'package:clean_movie/features/popular_movie/domian/repositories/movie_repository.dart';
import 'package:clean_movie/features/popular_movie/domian/usecases/get_popular_movies_usecase.dart';
import 'package:clean_movie/features/popular_movie/presentation/bloc/popular_movie_bloc.dart';
import 'package:clean_movie/features/search_movie/data/datasources/search_movie_remote_data_sources.dart';
import 'package:clean_movie/features/search_movie/data/datasources/search_movie_remote_data_sources_impl.dart';
import 'package:clean_movie/features/search_movie/data/repositories/search_movie_repository_impl.dart';
import 'package:clean_movie/features/search_movie/domian/usecases/get_search_movies_usecase.dart';
import 'package:clean_movie/features/search_movie/presentation/bloc/search_movie_bloc.dart';
import 'package:clean_movie/features/trending_movie/data/datasources/trending_movie_remote_data_sources.dart';
import 'package:clean_movie/features/trending_movie/data/datasources/trending_movie_remote_data_sources_impl.dart';
import 'package:clean_movie/features/trending_movie/data/repositories/trending_movie_repository_impl.dart';
import 'package:clean_movie/features/trending_movie/domian/repositories/movie_repository.dart';
import 'package:clean_movie/features/trending_movie/domian/usecases/get_trending_movies_usecase.dart';
import 'package:clean_movie/features/trending_movie/presentation/bloc/trending_movie_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/search_movie/domian/repositories/search_movie_repository.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  //bloc
  getIt.registerFactory(() => PopularMovieBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMovieBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMovieBloc(searchMovies: getIt()));
  //usecase
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));
  // repository
  getIt.registerLazySingleton<MovieRepository>(
      () => PopularMovieRepositoryImpl(popularMovieRemoteDataSource: getIt()));
  getIt.registerLazySingleton<TrendingMovieRepository>(() =>
      TrendingMovieRepositoryImpl(trendingMovieRemoteDataSource: getIt()));
  getIt.registerLazySingleton<SearchMoviesRepository>(
      () => SearchMovieRepositoryImpl(searchMovieRemoteDataSource: getIt()));

  //datasources
  getIt.registerLazySingleton<PopularMovieRemoteDataSource>(
      () => PopularMovieRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<TrendingMovieRemoteDataSource>(
      () => TrendingMovieRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<SearchMovieRemoteDataSource>(
      () => SearchMovieRemoteDataSourceImpl(client: getIt()));
  // http service

  getIt.registerLazySingleton(() => http.Client());
}
