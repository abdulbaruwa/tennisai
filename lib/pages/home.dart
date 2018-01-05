import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../models/tournament.dart';
import '../models/tournament.dart' as _tournamentModels;
import '../pages/touranmentDetails.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class _Page {
  _Page({this.label});
  final String label;
  String get id => label[0];
}

class Landing extends StatefulWidget {
  Landing({Key key, this.tournaments}) : super(key: key);
  List<Tournament> tournaments;
  @override
  LandingState createState() => new LandingState();
}

class LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    final Map<_Page, List<Tournament>> _allPages = <_Page, List<Tournament>>{
      new _Page(label: 'UPCOMING'): widget.tournaments.sublist(0, 2).toList(),
      new _Page(label: 'WATCHED'): widget.tournaments.sublist(2, 5).toList()
    };

    return new DefaultTabController(
      length: _allPages.length,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: const Text('Home'),
                pinned: true,
                // expandedHeight: 150.0,
                forceElevated: innerBoxIsScrolled,
                bottom: new TabBar(
                  tabs: _allPages.keys
                      .map((_Page page) => new Tab(text: page.label))
                      .toList(),
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: _allPages.keys.map((_Page page) {
              return new ListView(
                children: ListTile
                    .divideTiles(
                        color: Theme.of(context).primaryColor,
                        context: context,
                        tiles: _allPages[page].map((Tournament data) {
                          return new TournamentCard(tournament: data);
                        }).toList())
                    .toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// A card to display tournament details
class TournamentCard extends StatelessWidget {
  // final TextStyle titleStyle =
  //     const PestoStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  // final TextStyle authorStyle =
  //     const PestoStyle(fontWeight: FontWeight.w500, color: Colors.black54);
  const TournamentCard({Key key, this.tournament, this.onTap})
      : super(key: key);

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
