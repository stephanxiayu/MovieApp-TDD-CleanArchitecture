




import 'package:clean_movie/features/trending_movie/domian/entities/movie_entity.dart';
import 'package:clean_movie/features/trending_movie/domian/repositories/movie_repository.dart';
import 'package:clean_movie/features/trending_movie/domian/usecases/get_trending_movies_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'get_trending_movies_usecase_test.mocks.dart';




@GenerateNiceMocks([MockSpec<TrendingMovieRepository>()])

void main(){
 late GetTrendingMovies getTrendingMoviesUsecase;
 late MockTrendingMovieRepository mockMovieRepository;

  setUp(()  {
mockMovieRepository=MockTrendingMovieRepository();
getTrendingMoviesUsecase=GetTrendingMovies(mockMovieRepository);
  });


final tMovieList=[
  TrendingMovieEntity(id: 1, title: "Test Movie 1", overview: "Description 1", posterPath: "/image1"),
    TrendingMovieEntity(id: 2, title: "Test Movie 2", overview: "Description 2", posterPath: "/image2"),
];
  test('should get trending move from respository',()async{
    //arrange
    when(mockMovieRepository.getTrendingMovies()).thenAnswer((_)async => tMovieList);

    // act

    final result=await getTrendingMoviesUsecase();

    //assert

    expect(result, tMovieList);

    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);

  });
}