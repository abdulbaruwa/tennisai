import 'package:flutter/material.dart';

class SettingsTab extends StatefulWidget {
  SettingsTab({Key key}) : super(key: key);
  @override
  SettingsTabState createState() => new SettingsTabState();
}

class SettingsTabState extends State<SettingsTab> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => new Container(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: <Widget>[
          new Padding(
              padding: const EdgeInsets.only(left:5.0, top: 5.0), child: new _UserProfile()),
          new Icon(Icons.search, size: 150.0, color: Colors.black12),
          new Text('Profile & Settings tab content')
        ],
      ));
}

class _ProfileSection extends StatelessWidget{
  const _ProfileSection ({Key key}) : super(key: key);

  @override
   Widget build(BuildContext context) => new Container(
     color: Colors.amber,
     child: new SizedBox(
       height: 200.0,
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        
        children: <Widget>[
          new Padding(
              padding: const EdgeInsets.only(left:5.0, top: 5.0), child: new _UserProfile()),
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
