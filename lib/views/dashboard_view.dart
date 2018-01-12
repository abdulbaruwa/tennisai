import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'tournament_item.dart';
import '../containers/tournament_details.dart';
import '../keys/keys.dart';

class _Page {
  _Page({this.label, this.tabSource, this.key});
  final String label;
  final Key key;
  TournamentDetailsActionSource tabSource;
  String get id => label[0];
}

class DashboardView extends StatelessWidget{

  final List<Tournament> watchedTournaments;
  final List<Tournament> enteredTournaments;

  DashboardView({Key key, @required this.watchedTournaments, @required this.enteredTournaments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<_Page, List<Tournament>> _allPages = <_Page, List<Tournament>>{
      new _Page(label: 'UPCOMING', tabSource: TournamentDetailsActionSource.upcoming, key: TennisAiKeys.upcomingSubTab): enteredTournaments.toList(),
      new _Page(label: 'WATCHED', tabSource: TournamentDetailsActionSource.watching, key:TennisAiKeys.watchingSubTab): watchedTournaments.toList()
    };

    // print('enteredTournaments ${enteredTournaments.length}');
    // print('watchedTournamens ${watchedTournaments.length}');

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
                      .map((_Page page) => new Tab(text:  describeEnum(page.tabSource).toUpperCase()))
                      .toList(),
                ),
              ),
            ];
          },
          body: new TabBarView(
            key: TennisAiKeys.dashBoardTab,
            children: _allPages.keys.map((_Page page) {
              return new ListView(
                key: page.key,
                children: ListTile
                    .divideTiles(
                        color: Theme.of(context).primaryColor,
                        context: context,
                        tiles: _allPages[page].map((Tournament data) {
                          return new TournamentItem(tournament: data, source: describeEnum(page.tabSource),
                          onTap: () => _onTap(context, data, page.tabSource)

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

  void _onTap(BuildContext context, Tournament tournament, TournamentDetailsActionSource source){
      Navigator
        .of(context)
        .push(new MaterialPageRoute(
          builder: (_) => new TournamentDetails(id: tournament.code, source: source),
        ));
  }
}
