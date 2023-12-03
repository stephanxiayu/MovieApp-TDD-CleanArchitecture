



import 'package:clean_movie/core/errors/server_exceptions/server_exception.dart';
import 'package:clean_movie/features/search_movie/data/datasources/search_movie_remote_data_sources.dart';
import 'package:clean_movie/features/search_movie/data/datasources/search_movie_remote_data_sources_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'search_movie_remote_datasources_test.mocks.dart';



@GenerateMocks([http.Client])
void main(){
 late SearchMovieRemoteDataSource remoteDataSources;
late MockClient mockHttpClient;
  setUp(()async{
mockHttpClient=MockClient();
remoteDataSources=SearchMovieRemoteDataSourceImpl(client:mockHttpClient);

  });
    const tQuery = 'Avengers';
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

const sUrl = 'https://api.themoviedb.org/3/search/movie?query=$tQuery&api_key=2ba9c5f0306f4c6bcc5678e2cdbbab5e';

 test('should perfom a GET request on a url to get search movies', () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(sUrl))).
    thenAnswer((_) async => http.Response(sampleApiResponse, 200));

    // act
    await remoteDataSources.searchMovies(tQuery);

    // assert
    verify(mockHttpClient.get(Uri.parse(sUrl)));
  });

  test('should throw a ServerException when the response code is 404', () async {
    // arrange
    when(mockHttpClient.get(any)).
    thenAnswer((_) async => http.Response('Something went wrong', 404));

    // act
    final call = remoteDataSources.searchMovies;

    // assert
    expect(() => call(tQuery), throwsA(isA<ServerException>()));
  });

}