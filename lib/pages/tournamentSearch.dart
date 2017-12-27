import 'package:flutter/material.dart';
import '../models/tournament.dart';

class TournamentSearch extends StatelessWidget{
  const TournamentSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){

     final ThemeData themedata = Theme.of(context);
    return  new Scrollbar(
              child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 4.0),
            children: [new Text('Hellp')],
          ));
     //return new ListView(children: <Widget>[new Text('Tournament Search')]);

  }
}