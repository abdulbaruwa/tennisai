import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget{
  SettingsTab ({Key key}) : super(key: key);  
  @override
  SettingsTabState createState() => new SettingsTabState();
} 

class SettingsTabState extends State<SettingsTab> {
    static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => new Container(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(Icons.search, size: 150.0, color: Colors.black12),
          new Text('Profile & Settings tab content')
        ],
      )
      );
}

