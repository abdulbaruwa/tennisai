import 'dart:async';
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
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => _show());
  }

  void _show() {
    setState(() {
      _visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        body: new Row(children: <Widget>[
          new Expanded(
              child: new Container(
                  color: Colors.indigo,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Text('Tennis.Ai',
                          style: Theme.of(context)
                              .accentTextTheme
                              .display1
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 50.0)),
                                  Column(children: <Widget>[
                                    Container(padding: const EdgeInsets.only(bottom: 10 ),
                                      child: Text('Welcome',style:TextStyle(fontSize:30,color: Colors.white,))),
                                    Container(padding: const EdgeInsets.only(top: 10, bottom: 10 ),
                                      child: Text("You're only a few steps away from joining Tennis.Ai",style:TextStyle(fontSize:16,color: Colors.white,))),
                      AnimatedOpacity(
                          opacity: _visible ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 500),
                          child: new Container(
                            color: Colors.white,
                            child: new Container(
                                height: 250.0,
                                child: new Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Row(children: <Widget>[
                                          Expanded(
                                              child: RaisedButton(
                                                  onPressed: widget.isSignedIn == false ? widget.onGoogleSignInSelected : null,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 10, 0, 10),
                                                    child: Stack(
                                                      children: <Widget>[
                                                        Image(
                                                            image: AssetImage(
                                                                "assets/google_logo.png"),
                                                            height: 35.0),
                                                        Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets.only(left:10,top: 5),
                                                                child: Text('Sign in with Google',style:TextStyle(fontSize:20,color: Colors.blueGrey,),
                                                                ),
                                                              )
                                                            ])
                                                      ],
                                                    ),
                                                  )))
                                        ])),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: RaisedButton(
                                        onPressed: widget.isSignedIn == false ? widget.onEmailSignInSelected : null,
                                        //  onPressed: () {
                                        //   Navigator.push(context, new MaterialPageRoute(
                                        //       builder: (BuildContext context) => new EmailSignUp()));
                                        //     },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 10, 0, 10),
                                              child: Stack(
                                                children: <Widget>[
                                                  Icon(Icons.email,
                                                      color: Colors.blueGrey,
                                                      size: 35.0),
                                                  Row(mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  left: 10,
                                                                  top: 5),
                                                          child: Text(
                                                            'Sign in with Email',
                                                            style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.blueGrey,
                                                            ),
                                                          ),
                                                        )
                                                      ])
                                                ],
                                              ),
                                            ))),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: CustomPaint(
                                                      painter:
                                                          Drawhorizontalline())),
                                              Text(
                                                'or',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                              Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: CustomPaint(
                                                      painter:
                                                          Drawhorizontalline())),
                                            ])),
                                    FlatButton(
                                        onPressed: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: RichText(
                                                  text: TextSpan(
                                                    text: 'Already a member?',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.blueGrey),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                          text: ' Log in',
                                                          style: TextStyle(fontWeight: FontWeight                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )),
                                  ],
                                )),
                          ))]),
                    ],
                  )))
        ]));
  }
}
