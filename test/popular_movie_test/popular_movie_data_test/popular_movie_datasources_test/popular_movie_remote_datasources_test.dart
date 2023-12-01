

import 'package:clean_movie/features/popular_movie/data/datasources/popular_movie_remote_data_sources.dart';
import 'package:clean_movie/features/popular_movie/data/datasources/popular_movie_remote_data_sources_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'popular_movie_remote_datasources_test.mocks.dart';
@GenerateMocks([http.Client])
void main(){
 late PopularMovieRemoteDataSource remoteDataSources;
late MockClient mockHttpClient;
  setUp(()async{
mockHttpClient=MockClient();
remoteDataSources=PopularMovieRemoteDataSourceImpl(client:mockHttpClient);

  });
test("should perform a GET request on URL to get popular Movie", () async{
  //arrage

  when(mockHttpClient.get(any)).thenAnswer((_) async => http.Response("our API Response", 200));

  await remoteDataSources.getPopularMovies();

//assert

verify(mockHttpClient.get(Uri.tryParse("our API Response")));
});

//act 


}