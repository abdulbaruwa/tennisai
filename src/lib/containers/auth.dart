import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';
import '../views/Auth_view.dart';
import '../actions/actions.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = new GoogleSignIn(
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
        onInit: (store) {
          initSignIn(store);
        },
        builder: (context, vm) {
          return new AuthView(
              isSignedIn: vm.signedIn, onGoogleSignInSelected: vm.onGoogleSignInSelected);
        });
  }

  bool localSignIn(Store store){
    return false;
  }
  
  void initSignIn(Store store) async {
    print('Attempting to SignIn with Google');
    googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount account) async {
      var aut = await account.authentication;
      print(account.toString());
      print(aut.idToken);
      print(aut.accessToken);
      var azureAuthToken = await getAuthCode(aut.accessToken, aut.idToken);
      print('AzureAuthToken: $azureAuthToken');
      var setting = new Settings(
          accessToken: aut.accessToken,
          azureAuthToken: azureAuthToken,
          email: account.email,
          playerId: account.id,
          photoUrl: account.photoUrl);
      store.dispatch(new SignInCompletedAction(setting));
    });
    googleSignIn.signInSilently(suppressErrors: false).catchError((onError) {
      print('Silent Sign In Error: $onError');
      store.dispatch(new GoogleSilentSignInFailedAction());
    });
  }

  Map<String, Object> toJson(String auth, String id) {
    return {'authorization_code': auth, 'id_token': id};
  }

  Future<dynamic> makeHttpCall(Uri uri) async {
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(uri);
    request.headers.add('zumo-api-version', '2.0.0');
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    var jsonData = json.decode(responseBody);
    return jsonData;
  }

  Future<String> makeHttpPostCall(Uri uri, String jsonRequestBody) async {
    var httpClient = new HttpClient();
    return await httpClient.postUrl(uri).then((request) async {
      request.headers.contentType =
          new ContentType("application", "json", charset: "utf-8");
      request.headers.add('zumo-api-version', '2.0.0');
      request.write(jsonRequestBody);
      var response = await request.close();
      var result = await response.transform(utf8.decoder).join("");
      if (response.statusCode == 200) {
        return result;
      }
      return '';
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  Future<String> getAuthCode(String auth, String id) async {
    var jsonRequest = json.encode(toJson('', id));
    var uri = new Uri.https(
        'tennisaiservice.azurewebsites.net', '/.auth/login/google');
    var response = await makeHttpPostCall(uri, jsonRequest);

    if (response.isNotEmpty) {
      // The returned claim returns a json object that contain authenticationToken and azure user with sid. Not interested in the sid for now
      // Will use the provider id as the player id. No support for multiple provider auth for same player.
      return json.decode(response)['authenticationToken'] as String;
    }
    return '';
  }

  Future<Null> _handleSignOut() async {
    googleSignIn.disconnect();
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
        onGoogleSignInSelected: () async {
          print('auth_container.viewModel: Google Sign in selected');
          try {
            await googleSignIn.signIn();
          } catch (error) {
            print('onGoogleSignInSelected: $error');
          }
        });
  }
}
