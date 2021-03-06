import 'dart:io';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../keys/keys.dart';
import '../containers/profile_edit_container.dart';
import '../controls/usercontrols.dart';

class ProfileSection extends StatelessWidget {
  final Player player;
  final File changedAvatar;
  final SearchPreference searchPreference;
  const ProfileSection(
      {Key key, this.player, this.searchPreference, this.changedAvatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) => new Container(
      color: const Color(0xFFFAFAFA),
      child: new SizedBox(
          height: 85.0,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                  child: new _UserProfile(
                      player: player, changedAvatar: changedAvatar)),
            ],
          )));
}

// Displays the Vendor's name and avatar.
class _UserProfile extends StatelessWidget {
  final Player player;
  final File changedAvatar;
  const _UserProfile({Key key, this.player, this.changedAvatar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
        height: 76.0,
        child: new Row(children: <Widget>[
          new AvatarFromProfileOrLocal(
              playerId: player.id.toString(),
              latestImage: changedAvatar,
              profileImageUrl: player.profileImageUrl,
              usePublicProfile: player.usePublicProfileImage),
          const SizedBox(width: 8.0),
          new Expanded(
            child: new Padding(
                padding: const EdgeInsets.only(left: 2.0, top: 5.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      player != null
                          ? '${player.firstName} ${player.lastName}'
                          : '',
                      key: TennisAiKeys.profileName,
                    ),
                    new Text(player.address ?? ''),
                    new Text(player.postCode ?? '')
                  ],
                )),
          ),
        ]));
  }
}

class _LtaInfo extends StatelessWidget {
  const _LtaInfo({Key key, this.value}) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Expanded(
                child: new Container(
                    color: const Color(0xFFFC5CAE9),
                    // color: const Color(0xFFF5F5F5),
                    padding: const EdgeInsets.all(10.0),
                    child: new Text(
                      value,
                      style: theme.textTheme.caption,
                    )))
          ],
        ),
      ],
    );
  }
}

class _LabelTextRow extends StatelessWidget {
  _LabelTextRow({Key key, this.label, this.value}) : super(key: key);
  String label;
  String value;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 0.0, left: 10.0),
        child: new Column(
          children: [
            new Row(
              children: <Widget>[
                new Text(label, style: theme.textTheme.caption),
                new Expanded(
                    child: new Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 12.0),
                        alignment: Alignment.bottomRight,
                        child: new Text(
                          value,
                          textAlign: TextAlign.end,
                        )))
              ],
            )
          ],
        ));
  }
}

Widget _buildPreference(BuildContext context, Player player,
    SearchPreference searchPreference, File changedAvatar, Function logOut) {
  return new Container(
      child: new ListView(
    children: <Widget>[
      new ProfileSection(
        player: player,
        searchPreference: searchPreference,
        changedAvatar: changedAvatar,
      ),
      new _LtaInfo(value: 'LTA INFO'),
      new _LabelTextRow(
        label: 'Lta Number',
        value: player.ltaNumber == null ? '' : player.ltaNumber.toString(),
        key: TennisAiKeys.profileLtaNumber,
      ),
      new _LabelTextRow(
        label: 'Lta Rating',
        value: player.ltaRating == null ? '' : player.ltaRating,
        key: TennisAiKeys.profileLtaRating,
      ),
      new _LabelTextRow(
        label: 'Lta Ranking',
        value: player.ltaRanking == null ? '' : player.ltaRanking.toString(),
        key: TennisAiKeys.profileLtaRanking,
      ),
      new _LtaInfo(value: 'TOURNAMENT SEARCH PREFERENCE'),
      new _LabelTextRow(
          label: 'Gender',
          value: searchPreference.gender == 1 ? 'Male' : 'Female'),
      new _LabelTextRow(
          label: 'Distance', value: '${searchPreference.distance} miles'),
      new _LabelTextRow(
          label: 'Grade', value: searchPreference.grade.toString()),
      new _LabelTextRow(
          label: 'Age Group',
          value: searchPreference.ageGroup > 18
              ? 'Adult'
              : 'U${searchPreference.ageGroup}'),
      new _LabelTextRow(
          label: 'Status',
          value: tournamentStatus[
              searchPreference == null ? 0 : searchPreference.statusIndex]),
      new _LtaInfo(value: 'AUTHENTICATION'),
      new FlatButton(
          child: new Text('LOG OUT'),
          onPressed: () {
            logOut();
          })
    ],
  ));
}

class ProfileView extends StatelessWidget {
  final Player player;
  final SearchPreference searchPreference;
  final File changedAvatar;
  final Function logOut;
  const ProfileView(
      {Key key,
      this.player,
      this.searchPreference,
      this.changedAvatar,
      this.logOut})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: new ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          platform: Theme.of(context).platform,
        ),
        child: new Scaffold(
          appBar: new AppBar(
            actions: <Widget>[
              new FlatButton(
                child: new Text('EDIT',
                    style: Theme
                        .of(context)
                        .textTheme
                        .body1
                        .copyWith(color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute<DismissDialogAction>(
                        builder: (BuildContext context) =>
                            new ProfileEditContainer(),
                        fullscreenDialog: true,
                      ));
                },
              )
            ],
            title: new Text('Preference'),
          ),
          body: new Scrollbar(
            child: _buildPreference(
                context, player, searchPreference, changedAvatar, logOut),
          ),
        ));
  }
}
