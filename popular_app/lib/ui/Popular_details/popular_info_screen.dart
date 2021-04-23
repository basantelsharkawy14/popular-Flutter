import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popular_app/model/popular.dart';
import 'package:popular_app/ui/Popular_details/popular_info_provider.dart';
import 'package:provider/provider.dart';

class PopularInfoScreen extends StatelessWidget{
  final Result person;

  const PopularInfoScreen({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Movies"),
    ),
      body: ChangeNotifierProvider<PopularDetailsProvider>(
        create: (context) => PopularDetailsProvider(person),
        child: Consumer<PopularDetailsProvider>(
            builder: (buildContext, popularInfoProvider, _){
              var personInfo = popularInfoProvider.personInfo;
              return (popularInfoProvider.personInfo != null)?
                  Container(
                    child: SingleChildScrollView(
                     child: Padding(
                        padding:  const EdgeInsets.all(3),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://image.tmdb.org/t/p/w500"+personInfo.profilePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding
                            (padding: const EdgeInsets.all(3),
                            child: ExpandableNotifier(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      children: <Widget>[
                                        ScrollOnExpand(
                                          scrollOnExpand: true,
                                          scrollOnCollapse: false,
                                          child: ExpandablePanel(
                                            theme: const ExpandableThemeData(
                                              headerAlignment: ExpandablePanelHeaderAlignment.center,
                                              tapBodyToCollapse: true,
                                            ),
                                            header: Padding(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  "ExpandablePanel",
                                                  style: Theme.of(context).textTheme.body2,
                                                )),

                                            expanded: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                  Padding(
                                                      padding: EdgeInsets.only(bottom: 10),
                                                      child: Text(
                                                        personInfo.biography,
                                                        softWrap: true,
                                                        overflow: TextOverflow.fade,
                                                      )),
                                              ],
                                            ),
                                            builder: (_, collapsed, expanded) {
                                              return Padding(
                                                padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                                                child: Expandable(
                                                  collapsed: collapsed,
                                                  expanded: expanded,
                                                  theme: const ExpandableThemeData(crossFadePoint: 0),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    ),
                  ): Center(child: CircularProgressIndicator());
            }
        ),
      ),
    );
  }

}
