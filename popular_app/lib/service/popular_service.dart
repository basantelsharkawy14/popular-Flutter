import 'dart:convert';

import 'package:popular_app/model/popular.dart';
import 'package:http/http.dart' as http;
import 'package:popular_app/model/popular_details.dart';

class PopularService{
  Future <List<Result>> fetchPopular(int page) async{
    final response = await http.get(
        Uri.parse('https://api.themoviedb.org/3/person/popular?api_key=c33b8645aa8e8341bac7257fe7e27b71&language=en-US&page=$page'));
    if(response.statusCode == 200){
      return List<Result>.from((json.decode(response.body)["results"] as List)
          .map((e) => Result.fromJson(e))).toList();

    }else{
      throw Exception('FAILED TO LOAD Movies');
    }
  }

  Future <PopularInfo> fetchPopularDetails(int id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/person/$id?api_key=c33b8645aa8e8341bac7257fe7e27b71&language=en-US'));
    if (response.statusCode == 200) {
      return infoFromJson(response.body);
    } else {
      throw Exception('FAILED TO LOAD Movies');
    }
  }
}



