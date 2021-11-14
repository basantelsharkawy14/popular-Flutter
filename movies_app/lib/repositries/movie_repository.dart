import 'package:movies_app/model/movie.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/service/movie_service.dart';

class MovieRepository{
  MovieService _movieService =MovieService();
  Future<List<Movie>> futureMovies(){
    return _movieService.fetchMovies();

  }
  Future<Movies> futureMovie(int id){
    return _movieService.fetchMovie(id);

  }
}