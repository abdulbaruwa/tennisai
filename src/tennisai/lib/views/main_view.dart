import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/models.dart';
import 'photo_profile_view.dart';
import '../theme/ktheme.dart';
import '../containers/app_loading.dart';
import '../views/loading_indicator.dart';
import '../keys/keys.dart';

class MainView extends StatelessWidget {
  final Player player;
  final File changedAvatar;
  final List<RankingInfo> rankingInfos;
  final List<MatchResultInfo> matchResultInfos;

  MainView({Key key, this.player, this.rankingInfos, this.matchResultInfos, this.changedAvatar})
      : super(key: key);
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget _buildView(BuildContext context) {
    Iterable<Widget> listTiles = rankingInfos.map((RankingInfo item) => buildRankingInfoItem(context, item));
    Iterable<Widget> matcheResultsTiles = matchResultInfos.map((MatchResultInfo item) => buildEventItem(context, item));
    listTiles = ListTile.divideTiles(context: context, tiles: listTiles);

    return new Theme(
        data: kTheme.copyWith(platform: Theme.of(context).platform),
        child: new Scaffold(
            appBar: new AppBar(
              title: new Text(
                'Home',
                style: new TextStyle(
                  fontSize: Theme.of(context).platform == TargetPlatform.iOS
                      ? 17.0
                      : 20.0,
                ),
              ),
              elevation:
                  Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
            ),
            key: _scaffoldKey,
            body: new Scrollbar(
              child: new ListView(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  children: <Widget>[
                    new Container(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: new PhotoProfileView(player: this.player, changedAvatar: this.changedAvatar,)),
                    new SizedBox(height: 10.0),
                    new Text(
                      'Rankings',
                      style: Theme.of(context).textTheme.title,
                    ),
                    new SizedBox(height: 5.0),
                    buildRankingInfoHeader(context),
                    new Column(children: listTiles.toList()),
                    new SizedBox(height: 20.0),
                    new Text(
                      'Results',
                      style: Theme.of(context).textTheme.title,
                    ),
                    new SizedBox(height: 5.0),
                    buildEventsHeader(context),
                    new Column(children: matcheResultsTiles.toList())
                  ]),
            ))
        // new Column(
        //   children: <Widget>[
        //     new Container(
        //         padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        //         child: new PhotoProfileView(player: this.player)),
        // buildListTileHeader(context),
        // buildListTileHeader(context),
        //     new Column(children: listTiles.toList()),
        //   ],
        // ))

        );
  }

  @override
  Widget build(BuildContext context) {
    return new AppLoading(builder: (context, loading) {
      return loading.isLoading
          ? new LoadingIndicator(key: TennisAiKeys.homeTabLoading)
          : _buildView(context);
    });
  }


  Widget buildRankingInfoItem(BuildContext context, RankingInfo rankingInfo) {
    return new Container(
        // colo: const Color(0xFFFC5CAE9),
        child: new Row(children: <Widget>[
      new Container(
          width: 70.0,
          alignment: Alignment.topCenter,
          child: new Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Text(rankingInfo.ageGroup,
                  style: Theme.of(context).textTheme.body2))),
      new Expanded(
          child: new Container(
              width: 70.0,
              alignment: Alignment.topCenter,
              child: new Padding(
                  padding: const EdgeInsets.only(right: 1.0),
                  child: new Text(rankingInfo.national.toString(),
                      style: Theme.of(context).textTheme.body2)))),
      new Expanded(
          child: new Container(
              alignment: Alignment.topCenter,
              width: 70.0,
              child: new Padding(
                  padding: const EdgeInsets.only(right: 1.0),
                  child: new Text(rankingInfo.county.toString(),
                      style: Theme.of(context).textTheme.body2)))),
      new Expanded(
          child: new Container(
              width: 70.0,
              alignment: Alignment.topCenter,
              child: new Padding(
                  padding: const EdgeInsets.only(right: 1.0),
                  child: new Text(rankingInfo.totalPoints.toString(),
                      style: Theme.of(context).textTheme.body2)))),
    ]));
  }

  Widget buildEventsHeader(BuildContext context) {
    return new Container(
        color: const Color(0xFFFC5CAE9),
        child: new Row(children: <Widget>[
          new Container(
              alignment: Alignment.topCenter,
              width: 70.0,
              child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text('DATE',
                      style: Theme.of(context).textTheme.body2))),
          new Container(
              width: 120.0,
              alignment: Alignment.topCenter,
              child: new Padding(
                  padding: const EdgeInsets.only(right: 1.0),
                  child: new Text('TOURNAMENT',
                      style: Theme.of(context).textTheme.body2))),
          new Expanded(
              child: new Container(
                  width: 70.0,
                  alignment: Alignment.topCenter,
                  child: new Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: new Text('',
                          style: Theme.of(context).textTheme.body2)))),
          new Expanded(
              child: new Container(
                  width: 70.0,
                  alignment: Alignment.topRight,
                  child: new Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: new Text('POINTS',
                          style: new TextStyle(fontSize: 10.0))))),
        ]));
  }

  Widget buildRankingInfoHeader(BuildContext context) {
    return new Container(
        color: const Color(0xFFFC5CAE9),
        child: new Row(children: <Widget>[
          new Container(
              alignment: Alignment.topCenter,
              width: 70.0,
              child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text('GROUP',
                      style: Theme.of(context).textTheme.body2))),
          new Expanded(
              child: new Container(
                  width: 70.0,
                  alignment: Alignment.topCenter,
                  child: new Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: new Text('NATIONAL',
                          style: Theme.of(context).textTheme.body2)))),
          new Expanded(
              child: new Container(
                  width: 70.0,
                  alignment: Alignment.topCenter,
                  child: new Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: new Text('COUNTY',
                          style: Theme.of(context).textTheme.body2)))),
          new Expanded(
              child: new Container(
                  width: 70.0,
                  alignment: Alignment.topCenter,
                  child: new Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: new Text('POINTS',
                          style: Theme.of(context).textTheme.body2)))),
        ]));
  }

  Widget buildEventItem(BuildContext context, MatchResultInfo matchResultInfo) {
    return new Container(
        height: 50.0,
        alignment: Alignment.center,
        child: new Row(children: <Widget>[
          new Container(
              alignment: Alignment.centerLeft,
              child: new Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Text(
                      new DateFormat("dd-MMM-yy")
                          .format(matchResultInfo.tournamentDate),
                      style: new TextStyle(fontSize: 14.0)))),
          new Expanded(
              child: new Container(
                  alignment: Alignment.centerLeft,
                  child: new Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child: new Text(matchResultInfo.tournamentName,
                          style: new TextStyle(fontSize: 11.0))))),
          new Container(
              width: 33.0,
              alignment: Alignment.center,
              child: new Padding(
                  padding: const EdgeInsets.only(right: 1.0),
                  child: new Text(matchResultInfo.points.toString(),
                      style: new TextStyle(fontSize: 12.0)))),
          new Container(
              child: new Container(
                  width: 30.0,
                  child: new Padding(
                      padding: const EdgeInsets.only(right: 1.0),
                      child:getTick(matchResultInfo.appliedToRanking) ))),
        ]));
  }

  Widget getTick(bool condition) {
    if (condition) return new Icon(Icons.done);
    return new SizedBox();
  }

  Widget buildListTileHeader(BuildContext context) {
    return new MergeSemantics(
      child: new ListTile(
          dense: true,
          isThreeLine: false,
          title: buildRankingInfoHeader(context)),
    );
  }

  Widget buildListTile(BuildContext context, RankingInfo item) {
    return new MergeSemantics(
      child: new ListTile(title: buildRankingInfoItem(context, item)),
    );
  }
}
