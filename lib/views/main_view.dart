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

  MainView({Key key, this.player, this.rankingInfos, this.matchResultInfos}) : super(key: key);
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
            body: new Column(
              children: <Widget>[
                new Container(
                    padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                    child: new PhotoProfileView(player: this.player)),
                new Text('Home')
              ],
            )));
  }
}
