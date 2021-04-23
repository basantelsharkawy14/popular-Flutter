import 'package:flutter/material.dart';
import 'package:popular_app/model/popular.dart';
import 'package:popular_app/model/popular_details.dart';
import 'package:popular_app/repositotries/popular_repo.dart';

class PopularDetailsProvider extends ChangeNotifier{
  PopularInfo personInfo;

  PopularRepository  _popularRepository =  PopularRepository();
  PopularDetailsProvider(Result person){
    getMovie(person.id);
  }

  void getMovie(int id){
    _popularRepository.futurePopularDetails(id).then((newPerson){
      personInfo = newPerson;
      notifyListeners();
    }
    );
  }

}