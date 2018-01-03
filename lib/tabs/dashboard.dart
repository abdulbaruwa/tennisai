import 'package:flutter/material.dart';
import '../pages/basket.dart';
import '../models/tournament.dart' as _dart;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class Dashboard extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _kTheme.copyWith(platform: Theme.of(context).platform),
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text(
                'Basket',
                style: new TextStyle(
                  fontSize: Theme.of(context).platform == TargetPlatform.iOS
                      ? 17.0
                      : 20.0,
                ),
              ),
              elevation:
                  Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
            ),
            key: _scaffoldKey,
            body: new BasketPage(tournament: _dart.tournaments[0])));
  }
}
