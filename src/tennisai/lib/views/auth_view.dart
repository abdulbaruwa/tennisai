import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';


GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class AuthView extends StatelessWidget {
  AuthView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.indigo,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(padding: EdgeInsets.only(left: 10.0),
             child: new Text("You are not currently signed in.", style: Theme.of(context).accentTextTheme.display1)),
            new Text('Tennis.Ai', style: Theme.of(context).accentTextTheme.display1),
            new RaisedButton(
              child: const Text('SIGN IN'),
              onPressed: _handleSignIn,
            ),
          ],
        ));
  }

  Future<Null> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<Null> _handleSignOut() async {
    _googleSignIn.disconnect();
  }
}
