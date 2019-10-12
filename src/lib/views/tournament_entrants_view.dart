import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import '../models/models.dart';

class TournamentEntrantsView extends StatelessWidget {
  final TournamentInfo tournament;
  final List<Entrant> entrants;
  final bool activeEntrantSortOrder;
  final Function() onSortSelected;

  TournamentEntrantsView({this.tournament, this.entrants, this.onSortSelected, this.activeEntrantSortOrder});

  Widget buildListTile(BuildContext context, Entrant item) {
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
                    item.rating,
                    style: Theme.of(context).primaryTextTheme.body1,
                  ))
            ])),
        title: new Text(item.name),
        subtitle: new Text(item.status ?? ''),
        trailing: new ExcludeSemantics(
            child: new Column(children: [
          new Text('Ranking', style: new TextStyle(fontSize: 10.0)),
          new CircleAvatar(
            radius: 16.0,
            child: new Text(item.ranking.toString(),
                style: Theme.of(context).primaryTextTheme.body1),
          )
        ])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Entrant> tournamentEntrants = entrants;
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
            title: new Text(tournament.name),
            actions: <Widget>[
              new IconButton(
                icon: const Icon(Icons.sort_by_alpha),
                tooltip: 'Sort by rating',
                onPressed:() {onSortSelected();},
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
