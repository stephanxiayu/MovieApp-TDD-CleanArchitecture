import 'dart:convert';

import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
import 'package:clean_movie/features/trending_movie/data/datasources/trending_movie_remote_data_sources.dart';

import 'package:clean_movie/features/trending_movie/data/models/trending_movie_model.dart';

import 'package:http/http.dart' as http;

class TrendingMovieRemoteDataSourceImpl
    implements TrendingMovieRemoteDataSource {
  final http.Client client;

  TrendingMovieRemoteDataSourceImpl({required this.client});

  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "2ba9c5f0306f4c6bcc5678e2cdbbab5e";

  @override
  Future<List<TrendingMovieModel>> getTrendingMovie() async {
    final response = await client
        .get(Uri.parse("$baseUrl/trending/movie/day?api_key=$apiKey"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<TrendingMovieModel> trendingMovies =
          (responseBody['results'] as List)
              .map((movie) => TrendingMovieModel.fromJson(movie))
              .toList();
      return trendingMovies;
    } else {
      throw ServerException(
          'Server returned status code: ${response.statusCode}, body: ${response.body}');
    }
  }
}
