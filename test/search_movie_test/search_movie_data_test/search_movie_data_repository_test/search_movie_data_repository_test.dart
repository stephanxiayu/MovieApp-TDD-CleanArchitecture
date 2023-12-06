import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
import 'package:clean_movie/core/errors/server_failure/server_failure.dart';
import 'package:clean_movie/features/search_movie/data/datasources/search_movie_remote_data_sources.dart';
import 'package:clean_movie/features/search_movie/data/models/search_movie_model.dart';
import 'package:clean_movie/features/search_movie/data/repositories/search_movie_repository_impl.dart';
import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_movie_data_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchMovieRemoteDataSource>()])
void main() {
  late SearchMovieRepositoryImpl searchMovieRepositoryImpl;
  late MockSearchMovieRemoteDataSource mockSearchMovieRemoteDataSource;

  setUp(() {
    mockSearchMovieRemoteDataSource = MockSearchMovieRemoteDataSource();
    searchMovieRepositoryImpl = SearchMovieRepositoryImpl(
        searchMovieRemoteDataSource: mockSearchMovieRemoteDataSource);
  });

  const tQuery = 'Avengers';
  final tSearchMovieList = [
    SearchMovieModel(
        id: 1,
        title: "Test Movie 1",
        overview: "Description 1",
        posterPath: "/image1"),
    SearchMovieModel(
        id: 2,
        title: "Test Movie 2",
        overview: "Description 2",
        posterPath: "/image2"),
  ];

  test("should get search movie from remote data source", () async {
    when(mockSearchMovieRemoteDataSource.searchMovies(tQuery))
        .thenAnswer((_) async => tSearchMovieList);

    final result = await searchMovieRepositoryImpl.searchMovies(tQuery);
    verify(mockSearchMovieRemoteDataSource.searchMovies(tQuery));
    expect(result, isA<Right<Failure, List<SearchMovieEntity>>>());
  });

  test(
      "should retrun Server Failure when the call to remote data sourse is unsuccessful ",
      () async {
    when(mockSearchMovieRemoteDataSource.searchMovies(tQuery))
        .thenThrow(ServerException());
    final result = await searchMovieRepositoryImpl.searchMovies(tQuery);
    expect(result, isA<Left<Failure, List<SearchMovieEntity>>>());
  });
}
