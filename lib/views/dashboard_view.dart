import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'tournament_item.dart';
import '../containers/tournament_details.dart';

class _Page {
  _Page({this.label});
  final String label;
  String get id => label[0];
}

class DashboardView extends StatelessWidget{

  final List<Tournament> watchedTournaments;
  final List<Tournament> enteredTournaments;

  DashboardView({Key key, @required this.watchedTournaments, @required this.enteredTournaments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<_Page, List<Tournament>> _allPages = <_Page, List<Tournament>>{
      new _Page(label: 'UPCOMING'): enteredTournaments.toList(),
      new _Page(label: 'WATCHED'): watchedTournaments.toList()
    };

    print('enteredTournaments ${enteredTournaments.length}');
    print('watchedTournamens ${watchedTournaments.length}');
    // // try talk to the server
    // var service = new _services.TennisAiServices();
    // service.GetTournaments();

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
                          return new TournamentItem(tournament: data,
                          onTap: () => _onTap(context, data)

                            // TODO: Add logic to show details page.
                          ,);
                        }).toList())
                    .toList(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context, Tournament tournament){
      Navigator
        .of(context)
        .push(new MaterialPageRoute(
          builder: (_) => new TournamentDetailsPage(id: tournament.code, source: TournamentDetailsActionSource.watched),
        ));
  }
}
