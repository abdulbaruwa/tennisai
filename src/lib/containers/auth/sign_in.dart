import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:tennisai/actions/actions.dart';
import 'package:tennisai/models/models.dart';
import 'package:tennisai/views/auth/sign_in_view.dart';

class SignIn extends StatelessWidget {
  SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, SignInViewModel>(
        distinct: true,
        converter: SignInViewModel.fromStore,
        builder: (context, vm) {
          return new SignInView(onSignIn: vm.onSignIn);
        });
  }
}

class SignInViewModel {
  Function(EmailSignUpInfo signUpInfo) onSignIn;

  SignInViewModel({this.onSignIn});
  static SignInViewModel fromStore(Store<AppState> store) {
    return new SignInViewModel(onSignIn: (signInInfo) {
      print('Sign in player with email');

      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: signInInfo.email, password: signInInfo.password)
          .then((result) {
        result.user.getIdToken().then((onValue) {
          print('Auth token retrieved for signed in User');
          
          var playerId = IdGenerator().newPlayerId(result.user.uid);

          var setting = new Settings(
              email: result.user.email,
              playerId: playerId,
              name: result.user.displayName,
              photoUrl: result.user.photoUrl);

            store.dispatch(new SignInCompletedAction(setting));

        }).catchError((onError) {
          print('Error getting auth token for signed in user $onError');
        });
        print('Firebase user auth completed');
      }).catchError((onError) {
        print('Error signing in user with email $onError');
      });
    });
  }
}
