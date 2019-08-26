import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:swagger/api.dart';

import '../containers/tournament_details.dart';
import '../models/models.dart';

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class TournamentSearch extends StatefulWidget {
  final List<Tournament> tournaments;
  const TournamentSearch({Key key, this.tournaments}) : super(key: key);
  @override
  TournamentSearchState createState() => new TournamentSearchState();
}

class TournamentSearchState extends State<TournamentSearch> {
  List<Tournament> tournaments = [];

  @override
  void initState() {
    super.initState();
  }

  void handleSuccess(List<Tournament> value)
  {
    print('Recieved tournamnents ${value.length}');
    setState(() => tournaments = value);
  }

  @override
  Widget build(BuildContext context) {
    //final List<Tournament> tournaments =  tournaments;
    // print('Building Widget with : ${tournaments.length} tournament records');
    tournaments = widget.tournaments;

    Iterable<Widget> listTiles =
        tournaments.map((Tournament item) => new TournamentCard(
            tournament: item,
            onTap: () {
             // showTournamentDetailsPage(context, item);
             _onTap(context, item);
            }));
            
    listTiles = ListTile.divideTiles(
        context: context,
        tiles: listTiles,
        color: Theme.of(context).primaryColor);

    return new Scrollbar(
        child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 4.0),
            children: listTiles.toList()));
  }
}

// A card to display tournament details
class TournamentCard extends StatelessWidget {
  const TournamentCard({Key key, this.tournament, this.onTap})
      : super(key: key);

  final Tournament tournament;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    var tournamentDate =
        "${new DateFormat("yMMMEd").format(tournament.startDateTime)} to ${ new DateFormat("yMMMEd").format(tournament.endDateTime)}";
    return new GestureDetector(
      onTap: onTap,
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            child: new ListTile(
              title: new Text(tournament.name, style: new TextStyle(color: Theme.of(context).primaryColor, fontSize: 18.0)),
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

 void _onTap(BuildContext context, Tournament tournament) {
    print('tournament_search:_onTap: ${tournament.code}');
    Navigator.of(context).push(new MaterialPageRoute(
          builder: (_) =>
              new TournamentDetails(id: tournament.code, source: TournamentDetailsActionSource.search)
          
        ));
  }