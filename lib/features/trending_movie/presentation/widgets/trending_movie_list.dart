import 'package:clean_movie/features/trending_movie/domian/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class TrendingMovieList extends StatelessWidget {
  final List<TrendingMovieEntity> trendingMovieEntity;
  const TrendingMovieList({super.key, required this.trendingMovieEntity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: trendingMovieEntity.length,
      itemBuilder: (context, index) {
        final movie = trendingMovieEntity[index];
        return ListTile(
          leading: Image.network(
            "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Text(movie.title),
          subtitle: Text(movie.overview),
          onTap: () {},
        );
      },
    );
  }
}
