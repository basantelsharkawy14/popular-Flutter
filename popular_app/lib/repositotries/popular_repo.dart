import 'package:popular_app/model/popular_details.dart';
import 'package:popular_app/service/popular_service.dart';

import 'package:popular_app/model/popular.dart';
class PopularRepository{
  PopularService _popularService = PopularService();
  Future<List<Result>> futurePopular(int page){
    return _popularService.fetchPopular(page);
  }

  Future<PopularInfo> futurePopularDetails(int id){
    return _popularService.fetchPopularDetails(id);
  }
}