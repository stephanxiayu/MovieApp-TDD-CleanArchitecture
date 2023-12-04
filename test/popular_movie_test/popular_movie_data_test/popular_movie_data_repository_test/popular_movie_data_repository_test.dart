import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
import 'package:clean_movie/core/errors/server_failure/server_failure.dart';
import 'package:clean_movie/features/popular_movie/data/datasources/popular_movie_remote_data_sources.dart';
import 'package:clean_movie/features/popular_movie/data/models/popular_movie_model.dart';
import 'package:clean_movie/features/popular_movie/data/repositories/popular_movie_repository_impl.dart';
import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'popular_movie_data_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<PopularMovieRemoteDataSource>()])
void main() {
  late PopularMovieRepositoryImpl popularMovieRepositoryImpl;
  late MockPopularMovieRemoteDataSource mockPopularMovieRemoteDataSource;

  setUp(() {
    mockPopularMovieRemoteDataSource = MockPopularMovieRemoteDataSource();
    popularMovieRepositoryImpl = PopularMovieRepositoryImpl(
        popularMovieRemoteDataSource: mockPopularMovieRemoteDataSource);
  });

  final tPopularMovieModelList = [
    PopularMovieModel(
        id: 1,
        title: "Test Movie 1",
        overview: "Description 1",
        posterPath: "/image1"),
    PopularMovieModel(
        id: 2,
        title: "Test Movie 2",
        overview: "Description 2",
        posterPath: "/image2"),
  ];
  final tPopularMovieList = [
    const MovieEntity(
        id: 1,
        title: "Test Movie 1",
        overview: "Description 1",
        posterPath: "/image1"),
    const MovieEntity(
        id: 2,
        title: "Test Movie 2",
        overview: "Description 2",
        posterPath: "/image2"),
  ];

  test("should get popular movie from remote data source", () async {
    when(mockPopularMovieRemoteDataSource.getPopularMovies())
        .thenAnswer((_) async => tPopularMovieModelList);

    final result = await popularMovieRepositoryImpl.getPopularMovies();
    verify(mockPopularMovieRemoteDataSource.getPopularMovies());
// equals(Right<Failure, List<MovieEntity>>(tPopularMovieList)));
    expect(result, isA<Right<Failure, List<MovieEntity>>>());
  });

  test(
      "should retrun Server Failure when the call to remote data sourse is unsuccessful ",
      () async {
    when(mockPopularMovieRemoteDataSource.getPopularMovies())
        .thenThrow(ServerException());
    final result = await popularMovieRepositoryImpl.getPopularMovies();
    expect(result, isA<Left<Failure, List<MovieEntity>>>());
  });
}
