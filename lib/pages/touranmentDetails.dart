import 'package:flutter/material.dart';

import '../models/tournament.dart';

class TournamentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Scaffold(

      // bar
      appBar: new AppBar(
          title: new Text(
            'About',
            style: new TextStyle(
              fontSize: Theme.of(context).platform == TargetPlatform.iOS
                  ? 17.0
                  : 20.0,
            ),
          ),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0),
      body: new PageView(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[new Text('About Page content')],
          )
        ],
      ));
}

class TournamentDetailsPage extends StatefulWidget{
  const TournamentDetailsPage({Key key, this.tournament}) : super(Key key);
  final Tournament tournament;
  @override
  _TournamentDetailsPageState createState() => new _TournamentDetailsPageState();

}

class _TournamentDetailsPageState extends State<TournamentDetailsPage>{
  final GlobalKey<ScaffoldState> _scaffoldKey =  new GlobalKey<ScaffoldState>();
  
  double _getAppBarHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.3;

  @override Widget build(BuildContext context){}
  
}