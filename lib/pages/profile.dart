import 'package:flutter/material.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => new Container(
      color: Colors.amber,
      child: new SizedBox(
          height: 105.0,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Padding(
                  padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                  child: new _UserProfile()),
            ],
          )));
}

// Displays the Vendor's name and avatar.
class _UserProfile extends StatelessWidget {
  const _UserProfile({Key key}) : super(key: key);
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
                    new Text('Ademola Baruwa'),
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
        new Container(
            color: const Color(0xFFF5F5F5),
            padding: const EdgeInsets.all(10.0),
            child: new Text(
             value,
              style: theme.textTheme.caption,
            )),
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
    return new Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 0.0, left: 10.0),
        child: new Column(
          children: [
            new Row(
              children: <Widget>[
                new Text(label),
                new Expanded(
                    child: new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
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

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new ListView(
      children: <Widget>[
        new ProfileSection(),
        new _LtaInfo(value: 'LTA INFO'),
        new _LabelTextRow(label: 'Lta Number', value: '939383833'),
        new _LtaInfo(value: 'TOURNAMENT SEARCH PREFERENCE'),
        new _LabelTextRow(label: 'Gender', value: 'Female'),
        new _LabelTextRow(label: 'Distance', value: '30 miles'),
        new _LabelTextRow(label: 'Grade', value: '3'),
        new _LabelTextRow(label: 'Age Group', value: '3'),
      ],
    ));
  }
}
