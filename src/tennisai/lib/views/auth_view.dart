import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/plus.login',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class AuthView extends StatelessWidget {
  AuthView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initSignIn();

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
              onPressed: _handleSignIn,
            ),
          ],
        ));
  }

  void initSignIn() {
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount account) async {
      var authHeaders = await account.authHeaders;
      var aut = await account.authentication;
      print(account.toString());
      print(aut.idToken);
      print(aut.accessToken);
      var xx = await GetAuthCode(aut.accessToken, aut.idToken);
    });

    _googleSignIn.signInSilently();
  }

  Map<String, Object> toJson(String auth, String id) {
    return {'authorization_code': auth, 'id_token': id};
  }

  Future<dynamic> makeHttpPostCall(Uri uri, String jsonRequestBody) async {
    var httpClient = new HttpClient();
    await httpClient.postUrl(uri).then((request) async {
      request.headers.contentType = new ContentType("application", "json", charset: "utf-8");
      request.headers.add('zumo-api-version', '2.0.0');
      request.write(jsonRequestBody);
      var response = await request.close();
      var result = await response.transform(UTF8.decoder).join("");
      if (response.statusCode == 200) {
        return true;
      }
    }).catchError((onError) {
      print(onError.toString());
    });

    return false;
  }

  Future<bool> GetAuthCode(String auth, String id) async {
    var jsonRequest = JSON.encode(toJson('', id));
    var uri = new Uri.https(
        'tennisaiservice.azurewebsites.net', '/.auth/login/google');
    var response = await makeHttpPostCall(uri, jsonRequest);
    return response;
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
