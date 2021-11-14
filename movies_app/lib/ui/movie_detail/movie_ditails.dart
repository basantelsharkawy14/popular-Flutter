import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/model/movies.dart';
import 'package:movies_app/ui/movie_detail/movie_ditails.dart';
import 'package:movies_app/ui/movies_list/movies_list_provider.dart';
import 'package:movies_app/widget/Movie_widget.dart';
import 'package:provider/provider.dart';

import 'movie_provider.dart';

class MovieScreen extends StatefulWidget {
  final String title;
  final Movie movie;


  const MovieScreen({Key key, this.title, this.movie}) : super(key: key);
  @override
  _ArrayResponseState createState() => _ArrayResponseState();
}

class _ArrayResponseState extends State<MovieScreen> with TickerProviderStateMixin {
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
        body: ChangeNotifierProvider<MovieProvider>(
            create: (context) => MovieProvider(widget.movie),
            child: Consumer<MovieProvider>(
                builder: (buildContext, movieProvider, _){
                  var movie = movieProvider.movie;
                  return  (movieProvider.movie != null)?
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                        Padding(
                        padding: const EdgeInsets.all(3),
                        child:SizedBox(
                          width: 130.0,
                          height: 150.0,
                          child: Hero(tag: movie.id, child: Image.network("https://image.tmdb.org/t/p/w500"+movie.posterPath,fit: BoxFit.fill,)),
                        )
                    ),
                              Expanded(
                                child: Padding(
                      padding: const EdgeInsets.all(5),
                                      child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Padding(
                                                padding: const EdgeInsets.all(3.0),
                                              child:Text(movie.title, style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text("releaseYear : "+ movie.releaseDate.toString(), style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child:  Text("originalLanguage: "+ movie.originalLanguage.toString(), style: TextStyle(fontSize: 12, color: Colors.grey)),

                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: RatingBar.builder(
                                initialRating: movie.voteAverage,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 10,
                                itemSize: 18,
                                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                            ),
                          ),
                        ],
                      ),
                    ),
                              ),
                    ],
                          ),
                        )

                  ): Center(child: CircularProgressIndicator());
                }

            )
        )
    );
  }
}