import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../controls/usercontrols.dart';

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/plus.login',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

final ThemeData _kTheme = new ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.indigo,
  accentColor: Colors.redAccent,
);

class LandingView extends StatefulWidget {
  final bool isSignedIn;
  final Function onGoogleSignInSelected;
  final Function onEmailSignInSelected;

  LandingView(
      {Key key,
      this.isSignedIn,
      this.onGoogleSignInSelected,
      this.onEmailSignInSelected})
      : super(key: key);

  @override
  LandingState createState() => new LandingState();
}

class LandingState extends State<LandingView> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  PersistentBottomSheetController<Null> _bottomSheet;

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 2), () =>
  //     _showPersistentButtom()
  //  );
  // }

  @override
  Widget build(BuildContext context) {
    //initSignIn();

    return new Scaffold(
        key: _scaffoldKey,
        body: new Row(children: <Widget>[
          new Expanded(
              child: new Container(
                  color: Colors.indigo,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text("You are not currently signed in",
                              style: Theme.of(context)
                                  .accentTextTheme
                                  .display1
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: 'AbrilFatface'))),
                      new Text('Tennis.Ai',
                          style: Theme.of(context)
                              .accentTextTheme
                              .display1
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50.0)),
                      new Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: OutlineButton(
                              splashColor: Colors.grey,
                              onPressed: _bottomSheet == null
                                  ? _showPersistentButton
                                  : null,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              highlightElevation: 0,
                              borderSide: BorderSide(color: Colors.grey),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                        ],
                      ),
                    ],
                  )))
        ]));
  }

  void _showPersistentButton() {
    final PersistentBottomSheetController<Null> bottomSheet = _scaffoldKey
        .currentState
        .showBottomSheet((BuildContext bottomSheetContext) {
      return new Container(
        child: new Container(
            height: 250.0,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Stack(
                              children: <Widget>[
                                Image(
                                    image: AssetImage("assets/google_logo.png"),
                                    height: 35.0),
                                Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(
                                          'Sign in with Google',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ])
                              ],
                            ),
                          )))
                ]),
                RaisedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.email, size: 35.0),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Sign in with Email',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black12,
                                    ),
                                  ),
                                )
                              ])
                        ],
                      ),
                    )),
                Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(padding: const EdgeInsets.only(top: 3), child: CustomPaint(painter: Drawhorizontalline())),
                          Text(
                            'or',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Container(padding: const EdgeInsets.only(top: 3), child: CustomPaint(painter: Drawhorizontalline())),
                        ])),
                FlatButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: RichText(
                              text: TextSpan(
                                text: 'Already a member?',
                                style:
                                    TextStyle(fontSize: 18, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Log in',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            )),
      );
    });

    setState(() {
      _bottomSheet = bottomSheet;
    });

    _bottomSheet.closed.whenComplete(() {
      if (mounted) {
        setState(() {
          _bottomSheet = null;
        });
      }
    });
  }
}