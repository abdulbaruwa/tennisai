import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../models/tournament.dart' as _dart;

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class LandingHome extends StatelessWidget {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Landing(tournaments: _dart.tournaments);
  }
}
