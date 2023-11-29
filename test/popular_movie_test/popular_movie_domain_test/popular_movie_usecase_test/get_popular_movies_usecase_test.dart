
import 'package:clean_movie/popular_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/popular_movie/domian/repositories/movie_repository.dart';
import 'package:clean_movie/popular_movie/domian/usecases/get_popular_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_popular_movies_usecase_test.mocks.dart';






@GenerateNiceMocks([MockSpec<MovieRepository>()])
void main(){
 late GetPopularMovies usecase;
 late MockMovieRepository mockMovieRepository;

  setUp(()  {
mockMovieRepository=MockMovieRepository();
usecase=GetPopularMovies(mockMovieRepository);
  });


final tMovieList=[
  MovieEntity(id: 1, title: "Test Movie 1", overview: "Description 1", posterPath: "/image1"),
    MovieEntity(id: 2, title: "Test Movie 2", overview: "Description 2", posterPath: "/image2"),
];
  test('should get popular move from respository',()async{
    //arrange
    when(mockMovieRepository.getPopularMovies()).thenAnswer((_)async => tMovieList);

    // act

    final result=await usecase();

    //assert

    expect(result, tMovieList);

    verify(mockMovieRepository.getPopularMovies());
    verifyNoMoreInteractions(mockMovieRepository);

  });
}