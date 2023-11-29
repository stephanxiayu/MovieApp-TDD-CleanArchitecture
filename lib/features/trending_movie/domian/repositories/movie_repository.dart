
import 'package:clean_movie/features/trending_movie/domian/entities/movie_entity.dart';


abstract class TrendingMovieRepository{
 Future<List<TrendingMovieEntity>> getTrendingMovies();


}