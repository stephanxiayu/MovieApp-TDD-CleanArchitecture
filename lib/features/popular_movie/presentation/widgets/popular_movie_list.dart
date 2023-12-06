import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class PopularMovieList extends StatelessWidget {
  final List<MovieEntity> popularMovieEntity;
  const PopularMovieList({super.key, required this.popularMovieEntity});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: popularMovieEntity.length,
      itemBuilder: (context, index) {
        final movie = popularMovieEntity[index];
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
