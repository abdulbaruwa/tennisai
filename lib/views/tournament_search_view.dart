
import 'package:flutter/material.dart';
import '../models/tournament.dart';
import 'package:flutter/rendering.dart';
import "package:intl/intl.dart";

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);


class TournamentSearchView extends StatelessWidget{
  final List<Tournament> tournaments;

  const TournamentSearchView({Key key, this.tournaments}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    //final List<Tournament> tournaments =  tournaments;
    // print('Building Widget with : ${tournaments.length} tournament records');

    Iterable<Widget> listTiles =
        tournaments.map((Tournament item) => new _TournamentCard(
            tournament: item,
            onTap: () {
            //  showTournamentDetailsPage(context, item);
            }));
    listTiles = ListTile.divideTiles(
        context: context,
        tiles: listTiles,
        color: Theme.of(context).primaryColor);

    final ThemeData themedata = Theme.of(context);

    return new Scrollbar(
        child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 4.0),
            children: listTiles.toList()));
  }
}

// A card to display tournament details
class _TournamentCard extends StatelessWidget {
  const _TournamentCard({Key key, this.tournament, this.onTap})
      : super(key: key);

  final Tournament tournament;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    //return new GestureDetector(
    var tournamentDate =
        "${new DateFormat("yMMMEd").format(tournament.startDate)} to ${ new DateFormat("yMMMEd").format(tournament.endDate)}";
    return new GestureDetector(
      onTap: onTap,
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            child: new ListTile(
              title: new Text(tournament.name),
              subtitle: new Text(tournament.location),
            ),
            padding: const EdgeInsets.only(
                left: 1.0, right: 1.0, top: 1.0, bottom: 1.0),
          ),
          new Padding(
            child: new Text(
              tournamentDate,
              textAlign: TextAlign.left,
              //textScaleFactor: 1.0,
            ),
            padding: const EdgeInsets.only(left: 20.0),
          ),
          new SizedBox(
            height: 5.0,
          ),
          new Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Padding(
                child: new Text("Grade ${tournament.grade}"),
                padding: const EdgeInsets.only(left: 20.0),
              ),
              new Expanded(
                  child: new Padding(
                child: new Text(
                  "Entrants ${tournament.numberOfEntrants}",
                  textAlign: TextAlign.end,
                ),
                padding: const EdgeInsets.only(right: 10.0),
              ))
            ],
          ),
          new SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }
}
