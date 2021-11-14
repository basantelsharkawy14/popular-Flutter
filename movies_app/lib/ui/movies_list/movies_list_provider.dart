import 'package:flutter/cupertino.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/repositries/movie_repository.dart';

class MoviesProvider extends ChangeNotifier{
  List<Movie> movies;

  MovieRepository  _movieRepository =  MovieRepository();
MoviesProvider(){
  getMovies();
}

  void getMovies(){
  _movieRepository.futureMovies().then((newMovies){
    movies = newMovies;
    notifyListeners();
  }
  );
  }

  void addToFav(Movie movie){
  movie.isfav = !movie.isfav;
  notifyListeners();
  }

  void removeMovie (Movie movie){
  movies.remove(movie);

  notifyListeners();
  }
}