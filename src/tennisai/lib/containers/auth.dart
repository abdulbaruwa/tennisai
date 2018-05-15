import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/Auth_view.dart';
import '../actions/actions.dart';

import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = new GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/plus.login',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class AuthContainer extends StatelessWidget {
  AuthContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        onInit: (store) {initSignIn(store);},
        builder: (context, vm) {
          return new AuthView(isSignedIn: vm.signedIn);
        });
  }

  void initSignIn(Store store) {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) async {
      var authHeaders = await account.authHeaders;
      var aut = await account.authentication;
      print(account.toString());
      print(aut.idToken);
      print(aut.accessToken);
      var xx = await GetAuthCode(aut.accessToken, aut.idToken);
      store.dispatch(new SignInCompletedAction(new Settings()));
    });

    _googleSignIn.signInSilently();
  }

  Map<String, Object> toJson(String auth, String id) {
    return {'authorization_code': auth, 'id_token': id};
  }

  Future<dynamic> makeHttpPostCall(Uri uri, String jsonRequestBody) async {
    var httpClient = new HttpClient();
    await httpClient.postUrl(uri).then((request) async {
      request.headers.contentType =
          new ContentType("application", "json", charset: "utf-8");
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

class _ViewModel {
  final bool loading;
  final bool signedIn;
  final Settings settings;
  final Function onGoogleSignInSelected;

  _ViewModel(
      {@required this.loading,
      @required this.settings,
      @required this.signedIn,
      this.onGoogleSignInSelected});

  static _ViewModel fromStore(Store<AppState> store) {
    var settingsOptions = settingSelector(store.state);
    return new _ViewModel(
        settings: settingsOptions.isEmpty ? null : settingsOptions.value,
        loading: store.state.isLoading,
        signedIn: store.state.isSignedIn,
        onGoogleSignInSelected: (basket) {
          print('auth_container.viewModel: Google Sign in selected');
          store.dispatch(new SendBasketToLtaBasketAction(basket));
        });
  }
}
