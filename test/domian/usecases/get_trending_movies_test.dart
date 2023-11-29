import 'package:clean_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/domian/repositories/movie_repository.dart';
import 'package:clean_movie/domian/usecases/get_trending_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

 import 'get_trending_movies_test.mocks.dart';
@GenerateNiceMocks([MockSpec<MovieRepository>()])

void main(){
 late GetTrendingMovies usecase;
 late MockMovieRepository mockMovieRepository;

  setUp(()  {
mockMovieRepository=MockMovieRepository();
usecase=GetTrendingMovies(mockMovieRepository);
  });


final tMovieList=[
  MovieEntity(id: 1, title: "Test Movie 1", overview: "Description 1", posterPath: "/image1"),
    MovieEntity(id: 2, title: "Test Movie 2", overview: "Description 2", posterPath: "/image2"),
];
  test('should get trending move from respository',()async{
    //arrange
    when(mockMovieRepository.getTrendingMovies()).thenAnswer((_)async => tMovieList);

    // act

    final result=await usecase();

    //assert

    expect(result, tMovieList);

    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);

  });
}