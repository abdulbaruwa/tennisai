import 'package:flutter/material.dart';
import '../pages/profileEdit.dart';
import '../pages/profile.dart';

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

final BoxDecoration _underlineBoxDecoration = new BoxDecoration(
  border: new Border(
    bottom: const BorderSide(color: const Color(0xFFD9D9D9)),
  ),
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
              },
            ),
            body: new Container(
                child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new ProfileSection(),
                new Icon(Icons.search, size: 150.0, color: Colors.black12),
                new Text('Profile & Settings tab content')
              ],
            ))));
  }
}
