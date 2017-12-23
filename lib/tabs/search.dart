import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget{
  SearchTab ({Key key}) : super(key: key);  
  @override
  SearchTabState createState() => new SearchTabState();
} 

class SearchTabState extends State<SearchTab> {
    static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => new Container(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(Icons.search, size: 150.0, color: Colors.black12),
          new Text('Search tab content')
        ],
      )
      );
}
