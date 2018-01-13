import 'package:flutter/material.dart';
import '../models/tournament.dart';

class EntrantsPage extends StatefulWidget {
  EntrantsPage({Key key, this.tournament}) : super(key: key);
  Tournament tournament;

  @override
  EntrantsPageState createState() => new EntrantsPageState();
}

class EntrantsPageState extends State<EntrantsPage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();

  bool _reverseSort = false;
  Widget buildListTile(BuildContext context, Entrant item) {
    Widget secondary;

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
                    item.tournamentId,
                    style: Theme.of(context).primaryTextTheme.body1,
                  ))
            ])),
        title: new Text(item.tournamentName),
        subtitle: new Text(item.status),
        trailing: new ExcludeSemantics(
            child: new Column(
            children: [
              new Text('Ranking', style: new TextStyle(fontSize: 10.0)),
              new CircleAvatar(
          radius: 16.0,
          child: new Text(item.cost.toString(),
              style: Theme.of(context).primaryTextTheme.body1),
        )])
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Entrant> tournamentEntrants = widget.tournament.entrants;
    Iterable<Widget> listTiles =
        tournamentEntrants.map((Entrant item) => buildListTile(context, item));
    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);

    return new Theme(
        data: new ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          platform: Theme.of(context).platform,
        ),
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.tournament.name),
            actions: <Widget>[
              new IconButton(
                icon: const Icon(Icons.sort_by_alpha),
                tooltip: 'Sort by rating',
                onPressed: () {
                  setState(() {
                    _reverseSort = !_reverseSort;
                    tournamentEntrants.sort((a, b) => _reverseSort
                        ? b.cost.compareTo(a.cost)
                        : a.cost.compareTo(b.cost));
                  });
                },
              ),
            ],
          ),
          body: new Scrollbar(
              child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 4.0),
            children: listTiles.toList(),
          )),
        ));
  }
}
