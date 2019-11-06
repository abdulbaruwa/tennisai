import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models/models.dart';
import '../selectors/selectors.dart';

class AppLoading extends StatelessWidget {
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
  bool showSignUpOption;
  AuthMethod authMethod;
  PlayerRegistrationStatus isRegisteredUser;
  AppLoadViewModel({this.isLoading, this.isSignedIn, this.isRegisteredUser, this.isLoadingLocalState, this.authMethod, this.showSignUpOption});
  static AppLoadViewModel fromStore(Store<AppState> store){
      return new AppLoadViewModel(
        isLoading: isLoadingSelector(store.state),
        isSignedIn: isSignedInSelector(store.state),
        isRegisteredUser: isRegisteredUserSelector(store.state),
        isLoadingLocalState: isLoadingLocalSession(store.state),
        showSignUpOption: signUpSelector(store.state),
        authMethod: authMethodSelector(store.state)
      );
  }
}
