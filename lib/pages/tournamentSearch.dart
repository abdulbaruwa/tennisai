import 'package:flutter/material.dart';
import '../models/tournament.dart';
import 'package:flutter/rendering.dart';
import '../models/tournament.dart' as _tournamentModels;
import '../pages/touranmentDetails.dart';
import '../services/tournamentServices.dart' as _tournamentServices;
import "package:intl/intl.dart";

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
  //  platform: Theme.of(context).platform
);

class TournamentSearch extends StatefulWidget {
  const TournamentSearch({Key key}) : super(key: key);
  @override
  TournamentSearchState createState() => new TournamentSearchState();
}

class TournamentSearchState extends State<TournamentSearch> {
  List<Tournament> tournaments = [];

  @override
  void initState() {
    super.initState();

    // Fetch tournaments from the Server. 
    // TODO: Loggin needed in Failure section of Return 'Future'
    List<Tournament> latestTournaments = [];
    new _tournamentServices.TennisAiServices()
        .GetTournaments()
        .then((value) => handleSuccess(value))
        .catchError((error) => print('Error occured retrieving Tournaments from server, Error: ${error.toString()}'));

    //print('fetched latest tournaments from server: ${latestTournament.le}')
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

    Iterable<Widget> listTiles =
        tournaments.map((Tournament item) => new TournamentCard(
            tournament: item,
            onTap: () {
              showTournamentDetailsPage(context, item);
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
class TournamentCard extends StatelessWidget {
  const TournamentCard({Key key, this.tournament, this.onTap})
      : super(key: key);

  final Tournament tournament;
  final VoidCallback onTap;
//  String tournamentDate;
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

void showTournamentDetailsPage(BuildContext context, Tournament tournament) {
  print('Showing tourmanet detail with ${tournament.entrants.length} entrants');
  Navigator.push(
      context,
      new MaterialPageRoute<Null>(
        settings: const RouteSettings(name: '/tournament/details'),
        builder: (BuildContext context) {
          return new Theme(
            data: _kTheme.copyWith(platform: Theme.of(context).platform),
            child: new TournamentDetailsPage(tournament: tournament),
          );
        },
      ));
}
