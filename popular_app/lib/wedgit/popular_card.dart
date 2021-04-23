import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:popular_app/model/popular.dart';
import 'package:popular_app/ui/Popular_details/image_details.dart';
import 'package:popular_app/ui/Popular_details/popular_info_screen.dart';
import 'package:provider/provider.dart';

class PopularWidget extends StatelessWidget {
  final Result person;


  const PopularWidget({Key key, this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MovieScreen(person: person,)));
      },
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),



                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(3),
                          child:SizedBox(
                            width: 150.0,
                            height: 120.0,

                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PopularImage(person: person,)));
                              },
                                child: Hero( tag: person.id, child: Image.network("https://image.tmdb.org/t/p/w500"+person.profilePath,fit: BoxFit.fill,))),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PopularInfoScreen(person: person,)));
                          },
                            child: Center(child: Text(person.name, style: TextStyle(fontWeight: FontWeight.bold),))),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      );

  }
}