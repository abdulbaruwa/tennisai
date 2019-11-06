import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:tennisai/actions/actions.dart';
import 'package:tennisai/models/app_state.dart';
import 'package:tennisai/models/email_sign_up_info.dart';
import 'package:tennisai/views/auth/sign_up_view.dart';

class EmailSignUp extends StatelessWidget {
  EmailSignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, EmailSignUpViewModel>(
        distinct: true,
        converter: EmailSignUpViewModel.fromStore,
        builder: (context, vm) {
          return new SignUpView(onSignUp: vm.onSignUp);
        });
  }
}

class EmailSignUpViewModel {
  Function() onRegistrationCancelled;
  Function(EmailSignUpInfo signUpInfo) onSignUp;

  EmailSignUpViewModel({this.onRegistrationCancelled, this.onSignUp});
  static EmailSignUpViewModel fromStore(Store<AppState> store) {
    return new EmailSignUpViewModel(onSignUp: (signUpInfo) {
      print('Sign up player with email');
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: signUpInfo.email, password: signUpInfo.password)
          .then((user) {
        print('Firebase user created with uid {user.user.uid}');
        store.dispatch(
            new SignUpCompletedAction(signUpInfo.email, user.user.uid));
      }).catchError((onError) {
        print('Error signing up user: $onError');
      });
    });
  }
}
