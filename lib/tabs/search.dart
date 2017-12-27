import 'package:flutter/material.dart';
import '../pages/tournamentSearch.dart';
import '../models/enums.dart' as _enums;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class SearchTab extends StatefulWidget{
  SearchTab ({Key key}) : super(key: key);  
  @override
  SearchTabState createState() => new SearchTabState();
} 

class SearchTabState extends State<SearchTab> {
    static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _kTheme.copyWith(platform: Theme.of(context).platform),
        
        child: new Scaffold(
                appBar: new AppBar(
        title: new Text(
          'Tournament',
          style: new TextStyle(
            fontSize:
                Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
            key: _scaffoldKey,
            body: new TournamentSearch()
            ));
  }
}
