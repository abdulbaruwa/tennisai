import 'package:flutter/material.dart';
import '../models/models.dart';
import '../keys/keys.dart';

class ProfileSection extends StatelessWidget {
  final Player player;
  const ProfileSection({Key key, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Container(
      color: const Color(0xFFFAFAFA),
      child: new SizedBox(
          height: 105.0,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                  child: new _UserProfile(player:player)),
            ],
          )));
}

// Displays the Vendor's name and avatar.
class _UserProfile extends StatelessWidget {
  final Player player;
  const _UserProfile({Key key, this.player}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return new SizedBox(
        height: 96.0,
        child: new Row(children: <Widget>[
          new CircleAvatar(
            radius: 36.0,
            backgroundImage: const AssetImage('images/ademola.jpg'),
          ),
          const SizedBox(width: 8.0),
          new Expanded(
            child: new Padding(
                padding: const EdgeInsets.only(left: 2.0, top: 25.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(player.name, key: TennisAiKeys.profileName,),
                    new Text('99 Ashtead Avenue'),
                    new Text('KT21 2XX, Surrey')
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
                    color: const Color(0xFFF5F5F5),
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

class ProfileView extends StatelessWidget {
  final Player player;
  const ProfileView({Key key, this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListView(
      children: <Widget>[
        new ProfileSection(),
        new _LtaInfo(value: 'LTA INFO'),
        new _LabelTextRow(label: 'Lta Number', value: player.ltaNumber.toString(), key: TennisAiKeys.profileLtaNumber,),
        new _LtaInfo(value: 'TOURNAMENT SEARCH PREFERENCE'),
        new _LabelTextRow(label: 'Gender', value: 'Female'),
        new _LabelTextRow(label: 'Distance', value: '30 miles'),
        new _LabelTextRow(label: 'Grade', value: '3'),
        new _LabelTextRow(label: 'Age Group', value: 'U18'),
      ],
    ));
  }
}
