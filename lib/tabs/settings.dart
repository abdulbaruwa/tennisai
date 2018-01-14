import 'package:flutter/material.dart';
import '../pages/profileEdit.dart';
import '../pages/profile.dart';
import '../models/enums.dart' as _enums;

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
            appBar: new AppBar(
        
              title: new Text(
                'Profile',
                style: new TextStyle(
                  fontSize: Theme.of(context).platform == TargetPlatform.iOS
                      ? 17.0
                      : 20.0,
                ),
              ),
              elevation:
                  Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
            ),
            key: scaffoldKey,
            floatingActionButton: new FloatingActionButton(
              child: const Icon(Icons.edit),
              onPressed: () {
                print('pushing with context: ${context.widget.key}');
                Navigator.push(
                    context,
                    new MaterialPageRoute<_enums.DismissDialogAction>(
                      builder: (BuildContext context) => new UserProfileEdit(),
                      fullscreenDialog: true,
                    )
                    );
              },
            ),
            body: new Profile()));
  }
}
