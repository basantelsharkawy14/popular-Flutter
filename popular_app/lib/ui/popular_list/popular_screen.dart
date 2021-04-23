

import 'package:flutter/material.dart';
import 'package:popular_app/ui/popular_list/popular_list_provider.dart';
import 'package:popular_app/wedgit/popular_card.dart';
import 'package:provider/provider.dart';

class PopularScreen extends StatefulWidget {

  final String title;

  const PopularScreen({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PopularState();
  }
}
class PopularState extends State<PopularScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
        ),
        body: ChangeNotifierProvider<PopularProvider>(
          create: (context) => PopularProvider(),
          child: Consumer<PopularProvider>(
            builder: (buildContext, popularProvider,_) {
              return (popularProvider.popular != null) ?
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ),
                  controller: popularProvider.scrollController,
                  itemCount: popularProvider.popular.length,
                  itemBuilder: (BuildContext context, int index) {
                    final person = popularProvider.popular[index];
                    return PopularWidget(person: person,);
                  }

              ): Center(child: CircularProgressIndicator());
            }
          ),
        )

    );

  }
}
