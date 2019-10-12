import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swagger/api.dart';

import '../models/models.dart';
import 'tournament_item.dart';
import '../containers/tournament_details.dart';
import '../keys/keys.dart';
import '../controls/usercontrols.dart';

class _Page {
  _Page({this.label, this.tabSource, this.key});
  final String label;
  final Key key;
  TournamentDetailsActionSource tabSource;
  String get id => label[0];
}

class DashboardView extends StatelessWidget {
  final List<TournamentInfo> watchedTournaments;
  final List<TournamentInfo> enteredTournaments;
  final Function(TournamentInfo) onRemoveFromWatchList; 
  DashboardView(
      {Key key,
      @required this.watchedTournaments,
      @required this.enteredTournaments,
      this.onRemoveFromWatchList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('dashboard_view: Total items watched ${watchedTournaments.length}');
    print('dashboard_view: Total items entered ${enteredTournaments.length}');
    final Map<_Page, List<TournamentInfo>> _allPages = <_Page, List<TournamentInfo>>{
      new _Page(
          label: 'UPCOMING',
          tabSource: TournamentDetailsActionSource.upcoming,
          key: TennisAiKeys.upcomingSubTab): enteredTournaments.toList(),
      new _Page(
          label: 'WATCHED',
          tabSource: TournamentDetailsActionSource.watching,
          key: TennisAiKeys.watchingSubTab): watchedTournaments.toList()
    };
    return new DefaultTabController(
      length: _allPages.length,
      child: new Theme(
          data: new ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.indigo,
            platform: Theme.of(context).platform,
          ),
          child: new Scaffold(
            body: new NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  new SliverAppBar(
                    title: const Text('Home'),
                    pinned: true,
                    // expandedHeight: 150.0,
                    forceElevated: innerBoxIsScrolled,
                    bottom: new TabBar(
                      tabs: _allPages.keys
                          .map((_Page page) => new Tab(
                              text: describeEnum(page.tabSource).toUpperCase()))
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
                            tiles: _allPages[page].map((TournamentInfo data) {
                              return getTabForSource(context, page, data);
                            }).toList())
                        .toList(),
                  );
                }).toList(),
              ),
            ),
          )),
    );
  }

  Widget getTabForSource(
      BuildContext context, _Page page, TournamentInfo tournament) {
        
    if (page.tabSource == TournamentDetailsActionSource.watching) {
      print('dasbhoard_view.getTabForSource: tabSource: ${page.tabSource}, ${page.label}, tournament.name: ${tournament.name}');
      return buildDismisableItem(context, tournament, page);
    }

    return new TournamentItem(
      tournament: tournament,
      source: describeEnum(page.tabSource),
      onTap: () => _onTap(context, tournament, page.tabSource),
    );
  }

  Widget buildDismisableItem(
      BuildContext context, TournamentInfo tournament, _Page page) {
    final ThemeData theme = Theme.of(context);
    return new GestureDetector(
        onTap: () => _onTap(context, tournament, page.tabSource),
        key: TennisAiKeys.tournamentItem(tournament.code, describeEnum(page.tabSource)),
        child: new Dismissible(
          key: new ObjectKey(tournament),
          direction: DismissDirection.startToEnd,
          onDismissed: (DismissDirection direction) {
            onRemoveFromWatchList(tournament);
            // setState(() {
            //   leaveBehindItems.remove(item);
            // });
            final String action = (direction == DismissDirection.endToStart)
                ? 'archived'
                : 'deleted';
            Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text('You $action item ${tournament.name}'),
                // action: new SnackBarAction(
                //     label: 'UNDO',
                //     onPressed: () {
                //       //handleUndo(item);
                //     }
                //     )
                    ));
          },
          background: new Container(
              // color: theme.primaryColor,
              color: Colors.amber,
              child: const ListTile(
                  leading: const Icon(Icons.delete,
                      color: Colors.white, size: 36.0))),
          secondaryBackground: new Container(
              color: theme.primaryColor,
              child: const ListTile(
                  trailing: const Icon(Icons.archive,
                      color: Colors.white, size: 36.0))),
          child: new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                child: new ListTile(
                  dense: true,
                  title: new Text(tournament.name,
                      style: new TextStyle(
                          color: Colors.indigo, fontSize: 18.0),
                      key: TennisAiKeys.tournamentItemName(
                        tournament.code,
                        describeEnum(page.tabSource),
                      )),
                  subtitle: new Text(tournament.address),
                ),
                padding: const EdgeInsets.only(
                    left: 1.0, right: 1.0, top: 1.0, bottom: 1.0),
              ),
              new Padding(
                child: new Text(
                  "${new DateFormat("yMMMEd").format(tournament.startDateTime)} to ${ new DateFormat("yMMMEd").format(tournament.endDateTime)}",

                  textAlign: TextAlign.left,
                  //textScaleFactor: 1.0,
                ),
                padding: const EdgeInsets.only(left: 20.0),
              ),
              new SizedBox(
                height: 10.0,
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
                // children: <Widget>[
                //   new Padding(
                //     child: new Text("Grade ${tournament.grade}"),
                //     padding: const EdgeInsets.only(left: 20.0),
                //   ),
                //   new Expanded(
                //       child: new Padding(
                //     child: new Text(
                //       "Entrants ${tournament.numberOfEntrants}",
                //       textAlign: TextAlign.end,
                //     ),
                //     padding: const EdgeInsets.only(right: 10.0),
                //   ))
                // ],
              ),
              new SizedBox(
                height: 5.0,
              )
            ],
          ),
        ));
  }

  void _onTap(BuildContext context, TournamentInfo tournament,
      TournamentDetailsActionSource source) {
    Navigator.of(context).push(new MaterialPageRoute(
          builder: (_) =>
              new TournamentDetails(id: tournament.code, source: source),
        ));
  }
}
