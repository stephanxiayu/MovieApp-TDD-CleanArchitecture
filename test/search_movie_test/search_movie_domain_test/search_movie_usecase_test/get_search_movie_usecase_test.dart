import 'package:clean_movie/features/search_movie/domian/entities/search_movie_entity.dart';
import 'package:clean_movie/features/search_movie/domian/repositories/search_movie_repository.dart';
import 'package:clean_movie/features/search_movie/domian/usecases/get_search_movies_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_search_movie_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SearchMoviesRepository>()])
void main() {
  late SearchMovies searchMoviesUsecase;
  late MockSearchMoviesRepository mockSearchMovieRepository;

  setUp(() {
    mockSearchMovieRepository = MockSearchMoviesRepository();
    searchMoviesUsecase = SearchMovies(mockSearchMovieRepository);
  });
  const String tQuery = 'Inception';
  final tMovieList = [
    const SearchMovieEntity(
        id: 1,
        title: "Test Movie 1",
        overview: "Description 1",
        posterPath: "/image1"),
    const SearchMovieEntity(
        id: 2,
        title: "Test Movie 2",
        overview: "Description 2",
        posterPath: "/image2"),
  ];
  test("should get movie from the query from the repository", () async {
    //arrange
    when(mockSearchMovieRepository.searchMovies(any))
        .thenAnswer((_) async => Right(tMovieList));

    // act

    final result = await searchMoviesUsecase(tQuery);

    //assert

    expect(result, equals(Right(tMovieList)));

    verify(mockSearchMovieRepository.searchMovies(tQuery));
    verifyNoMoreInteractions(mockSearchMovieRepository);
  });
}
