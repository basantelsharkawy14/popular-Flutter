
import 'package:flutter/material.dart';
import 'package:movies_app/model/movie.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/repositries/movie_repository.dart';

class MovieProvider extends ChangeNotifier{
  Movies movie;

  MovieRepository  _movieRepository =  MovieRepository();
  MovieProvider(Movie movie){
    getMovie(movie.id);
  }

  void getMovie(int id){
    _movieRepository.futureMovie(id).then((newMovie){
      movie = newMovie;
      notifyListeners();
    }
    );
  }

}