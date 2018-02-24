import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';
import 'tournament_item.dart';
import '../containers/tournament_details.dart';
import '../keys/keys.dart';
import '../controls/usercontrols.dart';

import 'photo_profile_view.dart';
import '../theme/ktheme.dart';

class MainView extends StatelessWidget {
  final Player player;
  final List<RankingInfo> rankingInfos;
  final List<MatchResultInfo> matchResultInfos;

  MainView({Key key, this.player, this.rankingInfos, this.matchResultInfos})
      : super(key: key);
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Iterable<Widget> listTiles = rankingInfos
        .map((RankingInfo item) => buildRankingInfoItem(context, item));
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
                        child: new PhotoProfileView(player: this.player)),
                    new SizedBox(height: 10.0),
                    new Text('Rankings', style: Theme.of(context).textTheme.title,),
                    new SizedBox(height: 5.0),
                    buildRankingInfoHeader(context),
                    new Column(children: listTiles.toList()),
                    new SizedBox(height: 20.0),
                    new Text('Results', style: Theme.of(context).textTheme.title,),
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
