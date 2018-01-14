import 'package:flutter/material.dart';
import '../models/models.dart';

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class BasketView extends StatelessWidget {
  final Player player;
  final Basket basket;

  BasketView({Key key, this.player, this.basket}) : super(key: key);
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
            body: new Container(child: new Text('Basket Place Holder for ${player.name}'))));
  }
}
