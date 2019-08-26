import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swagger/api.dart';

import '../controls/usercontrols.dart';
import '../keys/keys.dart';

// A card to display tournament details
class TournamentItem extends StatelessWidget {
  // final TextStyle titleStyle =
  //     const PestoStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  // final TextStyle authorStyle =
  //     const PestoStyle(fontWeight: FontWeight.w500, color: Colors.black54);
  const TournamentItem(
      {@required this.tournament, @required this.source, @required this.onTap});

  final Tournament tournament;
  final VoidCallback onTap;
  final String source;

  @override
  Widget build(BuildContext context) {
    var tournamentDate =
        "${new DateFormat("yMMMEd").format(tournament.startDateTime)} to ${ new DateFormat("yMMMEd").format(tournament.endDateTime)}";

    return new GestureDetector(
      onTap: onTap,
      key: TennisAiKeys.tournamentItem(tournament.code, source),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            child: new ListTile(
              title: new Text(tournament.name,
                  style: new TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 18.0),
                  key:
                      TennisAiKeys.tournamentItemName(tournament.code, source)),
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
              new Expanded(
                  child: new TopBottomLabel(
                value: '${tournament.grade}',
                label: 'Grade',
              )),
              new Expanded(
                  child: new TopBottomLabel(
                value: '${tournament.tournamentStatus}',
                label: 'Status',
              )),
              new Expanded(
                  child: new TopBottomLabel(
                value: '${tournament.numberOfEntrants}',
                label: 'Entrants',
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
