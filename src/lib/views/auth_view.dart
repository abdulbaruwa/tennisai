import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/plus.login',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class AuthView extends StatelessWidget {
  final bool isSignedIn;
  final Function onGoogleSignInSelected;
  AuthView({Key key, this.isSignedIn, this.onGoogleSignInSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //initSignIn();

    return new Container(
        color: Colors.indigo,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Container(
                padding: EdgeInsets.only(left: 10.0),
                child: new Text("You are not currently signed in.",
                    style: Theme.of(context).accentTextTheme.display1)),
            new Text('Tennis.Ai',
                style: Theme.of(context).accentTextTheme.display1),
            new RaisedButton(
              child: const Text('SIGN IN'),
              onPressed: isSignedIn == false ? onGoogleSignInSelected  : null,
            ),
          ],
        ));
  }
}
