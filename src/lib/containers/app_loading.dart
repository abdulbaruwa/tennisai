import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:tennisai/views/sign_up_view.dart';
import 'package:tennisai/views/sign_in_view.dart';
import 'package:tennisai/views/forgot_password_view.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';

class AppLoading extends StatelessWidget {
  //final Function(BuildContext context, bool isLoading) builder;
  final Function(BuildContext context, AppLoadViewModel vm) builder;
  AppLoading({Key key, @required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppLoadViewModel>(
      distinct: true,
      converter: AppLoadViewModel.fromStore, 
      builder: builder,
    );
    //  return new ForgotPasswordView();
  }
}

class AppLoadViewModel{
  bool isLoading;
  bool isSignedIn;
  bool isLoadingLocalState;
  AuthMethod authMethod;
  PlayerRegistrationStatus isRegisteredUser;
  AppLoadViewModel({this.isLoading, this.isSignedIn, this.isRegisteredUser, this.isLoadingLocalState, this.authMethod});
  static AppLoadViewModel fromStore(Store<AppState> store){
      return new AppLoadViewModel(
        isLoading: isLoadingSelector(store.state),
        isSignedIn: isSignedInSelector(store.state),
        isRegisteredUser: isRegisteredUserSelector(store.state),
        isLoadingLocalState: isLoadingLocalSession(store.state),
        authMethod: authMethodSelector(store.state)
      );
  }
}
