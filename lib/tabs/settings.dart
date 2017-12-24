import 'package:flutter/material.dart';

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal,
  accentColor: Colors.redAccent,
);

enum DismissDialogAction {
  cancel,
  discard,
  save,
}

class SettingsTab extends StatefulWidget {
  SettingsTab({Key key}) : super(key: key);
  @override
  SettingsTabState createState() => new SettingsTabState();
}

class SettingsTabState extends State<SettingsTab> {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: _kTheme.copyWith(platform: Theme.of(context).platform),
        child: new Scaffold(
            key: scaffoldKey,
            floatingActionButton: new FloatingActionButton(
              child: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute<DismissDialogAction>(
                      builder: (BuildContext context) => new UserProfileEdit(),
                      fullscreenDialog: true,
                    ));

                // scaffoldKey.currentState.showSnackBar(const SnackBar(
                //   content: const Text('Not supported.'),
                // ));
              },
            ),
            body: new Container(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new _ProfileSection(),
                new Icon(Icons.search, size: 150.0, color: Colors.black12),
                new Text('Profile & Settings tab content')
              ],
            ))));
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({Key key}) : super(key: key);

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
    return new SizedBox(
      height: 96.0,
      child: new Row(
        children: <Widget>[
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
                    new Text('66 West Farm Avenue')
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class UserProfileEdit extends StatefulWidget {
  UserProfileEdit({Key key}) : super(key: key);
  @override
  UserProfileEditState createState() => new UserProfileEditState();
}

class UserProfileEditState extends State<UserProfileEdit> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  int quantity = 0;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return new Scaffold(
        appBar: new AppBar(title: const Text('Edit Profile'), actions: <Widget>[
          new FlatButton(
              child: new Text('SAVE',
                  style: theme.textTheme.body1.copyWith(color: Colors.white)),
              onPressed: () {
                Navigator.pop(context, DismissDialogAction.save);
              })
        ]),
        body: new Form(
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            new SizedBox(
              height: 96.0,
              child: new Row(
                children: <Widget>[
                  new CircleAvatar(
                    radius: 36.0,
                    backgroundImage: const AssetImage('images/ademola.jpg'),
                  ),
                  const SizedBox(width: 8.0),
                  new Expanded(
                    child: new Padding(
                        padding: const EdgeInsets.only(
                            left: 2.0, top: 10.0, right: 15.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'First name *', isDense: true),
                              keyboardType: TextInputType.text,
                            ),
                            new TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Last name *', isDense: true),
                              keyboardType: TextInputType.text,
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 5.0),
              child:
            new Column(
                 children: [
                            new TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Lta Number *', isDense: true),
                              keyboardType: TextInputType.number,
                            ),
                            new DropdownButtonHideUnderline(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(
                  color: const Color(0xFFD9D9D9),
                ),
              ),
              child: new DropdownButton<int>(
                items: <int>[0, 1].map((int value) {
                  return new DropdownMenuItem<int>(
                    value: value,
                    child: new Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: new Text(value == 1? 'Male' : 'Female'),
                    ),
                  );
                }).toList(),
                value: quantity,
                onChanged: (int value) { quantity = value;},
              ),
            ),
          ),
                          ],
            )),
            new Icon(Icons.search, size: 150.0, color: Colors.black12),
            new Text('Edit Profile & Settings tab content')
          ],
        )));
  }
}
