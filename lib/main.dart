import 'package:clean_movie/core/components/navigation_bar/navigation_bar.dart';
import 'package:clean_movie/features/popular_movie/presentation/bloc/bloc_popular_movie_event.dart';
import 'package:clean_movie/features/popular_movie/presentation/bloc/popular_movie_bloc.dart';
import 'package:clean_movie/features/search_movie/presentation/bloc/search_movie_bloc.dart';
import 'package:clean_movie/features/trending_movie/presentation/bloc/bloc_trending_movie_event.dart';
import 'package:clean_movie/features/trending_movie/presentation/bloc/trending_movie_bloc.dart';
import 'package:clean_movie/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  getItinit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Work in Progress',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              getIt<PopularMovieBloc>()..add(FetchPopularMovies()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<TrendingMovieBloc>()..add(FetchTrendingMovies()),
        ),
        BlocProvider(
          create: (context) => getIt<SearchMovieBloc>(),
        ),
      ], child: const MyNavigationBar()),
    );
  }
}
