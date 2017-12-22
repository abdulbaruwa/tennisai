import 'package:flutter/material.dart';
import '../models/tournament.dart';
import '../pages/entrants.dart';

class BasketPage extends StatefulWidget {
  BasketPage({Key key}) : super(key: key);
 // Tournament tournament;

  @override
  BasketPageState createState() => new BasketPageState();
}

class BasketPageState extends State<BasketPage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: new ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          platform: Theme.of(context).platform,
        ),
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Basket'),
          ),
          body: new Scrollbar(
              child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 4.0),
          )),
        ));
  }
}
