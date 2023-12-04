import 'dart:convert';

import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
import 'package:clean_movie/features/popular_movie/data/datasources/popular_movie_remote_data_sources.dart';
import 'package:clean_movie/features/popular_movie/data/models/popular_movie_model.dart';
import 'package:http/http.dart' as http;

class PopularMovieRemoteDataSourceImpl implements PopularMovieRemoteDataSource {
  final http.Client client;

  PopularMovieRemoteDataSourceImpl({required this.client});
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "2ba9c5f0306f4c6bcc5678e2cdbbab5e";

  @override
  Future<List<PopularMovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse("$baseUrl/movie/popular?api_key=$apiKey"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<PopularMovieModel> popularMovies =
          (responseBody['results'] as List)
              .map((movie) => PopularMovieModel.fromJson(movie))
              .toList();
      return popularMovies;
    } else {
      throw ServerException();
    }
  }
}
