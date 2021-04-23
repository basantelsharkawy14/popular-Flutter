
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:popular_app/model/popular.dart';

class PopularImage extends StatelessWidget{
  final Result person;


  const PopularImage({Key key, this.person}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text(person.name),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed: _save),
          ],
    ),
      body: Hero(
        tag: person.id,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://image.tmdb.org/t/p/w500"+person.profilePath),
              fit: BoxFit.cover,
            ),
          ),
          child:  Align(
            alignment: Alignment.bottomRight,
            child: Icon(Icons.more_vert),
          ),
        ),
      ),
    );

  }

  _save() async {
    if (await Permission.storage.request().isGranted) {
      var response = await Dio()
          .get(person.profilePath, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 60,
          name: person.name);
      print(result);
      _toastInfo("You have successfully added to your gallery.");
    }
  }

  _toastInfo(String info) {
    Fluttertoast.showToast(
        msg: info,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.green);
  }
}
