

import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
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
  const String sampleApiResponse = '''
{
  "page": 1,
  "results": [
    {
      "id": 1,
      "title": "Sample Movie",
      "overview": "Overview here",
      "poster_path": "/path2.jpg"
    }
  ],
  "total_pages": 1,
  "total_results": 1
}
''';
const tUrl="https://api.themoviedb.org/3/movie/popular?api_key=2ba9c5f0306f4c6bcc5678e2cdbbab5e";
test("should perform a GET request on URL to get popular Movie", () async{
  //arrage

 when(mockHttpClient.get(Uri.parse(tUrl))).
    thenAnswer((_) async => http.Response(sampleApiResponse, 200));

  await remoteDataSources.getPopularMovies();

//assert

verify(mockHttpClient.get(Uri.tryParse(tUrl)));
});

//act 
 test('should throw a ServerException when the response code is 404', () async {
    // arrange
    when(mockHttpClient.get(any)).
    thenAnswer((_) async => http.Response('Something went wrong', 404));

    // act
    final call = remoteDataSources.getPopularMovies;

    // assert
    expect(() => call(), throwsA(isA<ServerException>()));
  });


}