import 'package:flutter/material.dart';
import '../models/tournament.dart';
import '../pages/entrants.dart';

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class BasketPage extends StatefulWidget {
  BasketPage({Key key, this.tournaments}) : super(key: key);
  List<Tournament> tournaments;

  @override
  BasketPageState createState() => new BasketPageState();
}

class BasketPageState extends State<BasketPage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();

  Widget buildListTile(BuildContext context, Tournament item) {
    Widget secondary;
    print(item.name);
    print(item.grade);
    print(item.status);

    return new MergeSemantics(
      child: new ListTile(
        dense: true,
        leading: new ExcludeSemantics(
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              new Text('Rating', style: new TextStyle(fontSize: 10.0)),
              new CircleAvatar(
                  radius: 16.0,
                  child: new Text(
                    item.grade,
                    style: Theme.of(context).primaryTextTheme.body1,
                  ))
            ])),
        title: new Text(item.name),
        subtitle: new Text(item.status),
        trailing: new ExcludeSemantics(
            child: new Column(children: [
          new Text('Ranking', style: new TextStyle(fontSize: 10.0)),
          new CircleAvatar(
            radius: 16.0,
            child: new Text(item.grade,
                style: Theme.of(context).primaryTextTheme.body1),
          )
        ])),
      ),
    );
  }

  Widget buildTotalRow(BuildContext context, double totalAmount) {
    return new Container(
        color: Colors.lightBlue,
        child: new Row(children: <Widget>[
          new Container(
              alignment: Alignment.topRight,
              child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('TOTAL'))),
          new Expanded(
              child: new Container(
                  alignment: Alignment.topRight,
                  child: new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Text('£$totalAmount')))),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    List<Tournament> tournamentEntrants = widget.tournaments;
    Iterable<Widget> listTiles = tournamentEntrants
        .map((Tournament item) => buildListTile(context, item));
    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);
    return new Column(children: <Widget>[
      new SizedBox(
        height: 56.0,
        child: new Row(children: <Widget>[
          new Expanded(
            child: new Padding(
                padding: const EdgeInsets.only(left: 2.0, top: 5.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text('Ademola Baruwa'),
                    new Text('99 Ashtead Avenue'),
                    new Text('KT21 2XX, Surrey')
                  ],
                )),
          ),
        ]),
      ),
      //new ListView(),
      new Expanded(
        child: new Scrollbar(
            child: new ListView(
          padding: new EdgeInsets.symmetric(vertical: 4.0),
          children: listTiles.toList(),
        )),
      ),
      new SizedBox(
          height: 86.0,
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildTotalRow(context, 95.0),
                new Expanded(
                    child: new FlatButton(
                        onPressed: () {
                          print('Send to LTA button clicked');
                        },
                        child: new Text('SEND TO LTA BASKET')))
              ])),
    ]);
  }
}
