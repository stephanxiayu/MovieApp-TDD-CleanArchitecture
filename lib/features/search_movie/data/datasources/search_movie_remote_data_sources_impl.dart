import 'dart:convert';

import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
import 'package:clean_movie/features/search_movie/data/datasources/search_movie_remote_data_sources.dart';
import 'package:clean_movie/features/search_movie/data/models/search_movie_model.dart';




import 'package:http/http.dart' as http;

class SearchMovieRemoteDataSourceImpl implements SearchgMovieRemoteDataSource {
  final http.Client client;

  SearchMovieRemoteDataSourceImpl({required this.client});

  static const baseUrl = "https://api.themoviedb.org3";
  static const apiKey = "2ba9c5f0306f4c6bcc5678e2cdbbab5e";
  @override
  Future<List<SearchMovieModel>> searchMovies(String query)async {
    final response =
        await client.get(Uri.parse("$baseUrl/search/movie?query=$query&api_key=$apiKey"));
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<SearchMovieModel> searchMovies =
          (responseBody['results'] as List)
              .map((movie) => SearchMovieModel.fromJson(movie))
              .toList();
      return searchMovies;
    }else{
      throw ServerException();
    }
  }
}
