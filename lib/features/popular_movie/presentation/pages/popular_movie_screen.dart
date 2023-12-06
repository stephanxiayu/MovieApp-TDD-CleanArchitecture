import 'package:clean_movie/features/popular_movie/presentation/bloc/bloc_popular_movie_state.dart';
import 'package:clean_movie/features/popular_movie/presentation/bloc/popular_movie_bloc.dart';
import 'package:clean_movie/features/popular_movie/presentation/widgets/popular_movie_list.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMovieScreen extends StatelessWidget {
  const PopularMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PopularMovieBloc, PopularMovieState>(
          builder: (context, state) {
        if (state is PopularMovieLoading) {
          return const CircularProgressIndicator(
            color: Colors.red,
          );
        } else if (state is PopularMovieLoaded) {
          return PopularMovieList(popularMovieEntity: state.popularMovieEntity);
        } else if (state is PopularMovieError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
