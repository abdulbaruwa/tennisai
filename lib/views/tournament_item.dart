import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';

// A card to display tournament details
class TournamentItem extends StatelessWidget {
  // final TextStyle titleStyle =
  //     const PestoStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  // final TextStyle authorStyle =
  //     const PestoStyle(fontWeight: FontWeight.w500, color: Colors.black54);
  const TournamentItem({@required this.tournament, @required this.onTap});

  final Tournament tournament;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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

