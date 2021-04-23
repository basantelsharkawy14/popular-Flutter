
import 'package:flutter/material.dart';
import 'package:popular_app/model/popular.dart';
import 'package:popular_app/repositotries/popular_repo.dart';

class PopularProvider extends ChangeNotifier{
  List<Result> popular=[];
  int pageNum = 1;
  PopularRepository _popularRepository = PopularRepository();
   final ScrollController  scrollController = ScrollController();

  PopularProvider(){
    scrollController
        ..addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getPopular();
      }
    });
    getPopular();
  }

  void getPopular() async{
    List<Result> newPersons = await _popularRepository.futurePopular(pageNum);
      popular = [...popular , ...newPersons];
      notifyListeners();
      pageNum++;

  }
}