import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/ui/movie_detail/movie_ditails.dart';
import 'package:movies_app/ui/movies_list/movies_list_provider.dart';
import 'package:movies_app/widget/Movie_widget.dart';
import 'package:provider/provider.dart';

class NestedObjectResponse extends StatefulWidget {
  final String title;

  const NestedObjectResponse({Key key, this.title}) : super(key: key);
  @override
  _ArrayResponseState createState() => _ArrayResponseState();
}

class _ArrayResponseState extends State<NestedObjectResponse> with TickerProviderStateMixin {
  TabController _tabController;


  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: ChangeNotifierProvider<MoviesProvider>(
          create: (context) => MoviesProvider(),
           child: Consumer<MoviesProvider>(
               builder: (buildContext, moviesProvider, _){
                 return  (moviesProvider.movies != null)?
                 ListView.builder(
                     itemCount: moviesProvider.movies.length,
                     itemBuilder: (ctx, index){
                       final movie = moviesProvider.movies[index];
                       
                       return MovieWidget(movie: movie,);
                     }
                 ): Center(child: CircularProgressIndicator());
               }

           )
        )
    );
  }
}