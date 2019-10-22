import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tennisai/containers/email_sign_up_container.dart';

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
  final Function onEmailSignInSelected;
  AuthView(
      {Key key,
      this.isSignedIn,
      this.onGoogleSignInSelected,
      this.onEmailSignInSelected})
      : super(key: key);

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
                    style: Theme.of(context).accentTextTheme.display1.copyWith(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: 'AbrilFatface'))),
            new Text('Tennis.Ai',
                style: Theme.of(context).accentTextTheme.display1.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Container(
                  child: OutlineButton(
                    padding: EdgeInsets.only(bottom: 20),
                    splashColor: Colors.grey,
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (_) => new EmailSignUp()));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    highlightElevation: 0,
                    borderSide: BorderSide(color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Sign in with Email',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                new Center(
                  child: OutlineButton(
                    splashColor: Colors.grey,
                    onPressed:
                        isSignedIn == false ? onGoogleSignInSelected : null,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    highlightElevation: 0,
                    borderSide: BorderSide(color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image(
                              image: AssetImage("assets/google_logo.png"),
                              height: 35.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
