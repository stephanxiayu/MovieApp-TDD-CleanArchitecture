


import 'package:clean_movie/features/trending_movie/data/datasources/trending_movie_remote_data_sources.dart';
import 'package:clean_movie/features/trending_movie/data/models/trending_movie_model.dart';
import 'package:clean_movie/features/trending_movie/data/repositories/trending_movie_repository_impl.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'trending_movie_data_repository_test.mocks.dart';
@GenerateNiceMocks([MockSpec<TrendingMovieRemoteDataSource>()])
void main(){
 late TrendingMovieRepositoryImpl trendingMovieRepositoryImpl;
 late MockTrendingMovieRemoteDataSource mockTrendingMovieRemoteDataSource;


  setUp(() {
    mockTrendingMovieRemoteDataSource =MockTrendingMovieRemoteDataSource();
    trendingMovieRepositoryImpl= TrendingMovieRepositoryImpl(trendingMovieRemoteDataSource:mockTrendingMovieRemoteDataSource);
  });
  

 final tTrendingMovieList = [
    TrendingMovieModel(
        id: 1,
        title: "Test Movie 1",
        overview: "Description 1",
        posterPath: "/image1"),
    TrendingMovieModel(
        id: 2,
        title: "Test Movie 2",
        overview: "Description 2",
        posterPath: "/image2"),
  ];

  test("should get trending movie from remote data source", () async{
    when(mockTrendingMovieRemoteDataSource.getTrendingMovie()).thenAnswer((_)async => tTrendingMovieList);


    final result =await trendingMovieRepositoryImpl.getTrendingMovies();
    verify(mockTrendingMovieRemoteDataSource.getTrendingMovie());

    expect(result, equals(tTrendingMovieList));
  });
}