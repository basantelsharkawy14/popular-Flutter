import 'dart:convert';

import 'package:movies_app/model/movie.dart';
import 'package:movies_app/model/movies.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/4/discover/movie?api_key=6557d01ac95a807a036e5e9e325bb3f0&sort_by=popularity.desc'));
    if (response.statusCode == 200) {
      return List<Movie>.from((json.decode(response.body)["results"] as List)
          .map((e) => Movie.fromJson((e)))).toList();
    } else {
      throw Exception('FAILED TO LOAD Movies');
    }
  }

  Future <Movies> fetchMovie(int id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=6557d01ac95a807a036e5e9e325bb3f0&language=en-US'));
    if (response.statusCode == 200) {
      return moviesFromJson(response.body);
    } else {
      throw Exception('FAILED TO LOAD Movies');
    }
  }
}
