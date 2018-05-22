import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class RegistrationView extends StatelessWidget {
  final Settings settings;
  final Function() onRegistrationCancelled;
  RegistrationView({Key key, this.settings, this.onRegistrationCancelled}) : super(key: key);
  static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final lastName = new TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Last Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final firstName = new TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final btmNumber = new TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'BTM Number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = new Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: new Material(
        // borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.indigoAccent.shade100,
        elevation: 5.0,
        child: new MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.of(context).pushNamed('HomePage.tag');
          },
          color: Colors.indigoAccent,
          child: new Text('SAVE', style: new TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = new FlatButton(
      child: new Text(
        'CANCEL',
        style: new TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        onRegistrationCancelled();
        Navigator.of(context).pop();
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('Tennis.Ai',
                      style: Theme
                          .of(context)
                          .textTheme
                          .display2
                          .copyWith(color: Colors.indigoAccent)),
                  SizedBox(height: 18.0),
                  new Text("Enter the Player Name and LTA registration number.",
                      style: Theme
                          .of(context)
                          .accentTextTheme
                          .display1
                          .copyWith(fontSize: 18.0, color: Colors.grey)),
                  SizedBox(height: 20.0),
                ]),

            //logo,

            SizedBox(height: 8.0),
            firstName,
            SizedBox(height: 8.0),
            lastName,
            SizedBox(height: 8.0),
            btmNumber,
            SizedBox(height: 28.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
