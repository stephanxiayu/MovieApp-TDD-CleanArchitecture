import 'package:clean_movie/features/trending_movie/presentation/bloc/bloc_trending_movie_state.dart';
import 'package:clean_movie/features/trending_movie/presentation/bloc/trending_movie_bloc.dart';
import 'package:clean_movie/features/trending_movie/presentation/widgets/trending_movie_list.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingMovieScreen extends StatelessWidget {
  const TrendingMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
          builder: (context, state) {
        if (state is TrendingMovieLoading) {
          return const CircularProgressIndicator(
            color: Colors.red,
          );
        } else if (state is TrendingMovieLoaded) {
          return TrendingMovieList(
              trendingMovieEntity: state.trendingMovieEntity);
        } else if (state is TrendingMovieError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
