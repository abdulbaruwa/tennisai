import 'package:redux/redux.dart';
import 'package:tennisai/actions/auth_actions.dart';
import 'package:tennisai/keys/keys.dart';
import '../models/models.dart';
import '../routes.dart';

class NavigationMiddleware extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if(action is NavigateToEmailSignUpAction){
      TennisAiKeys.navKey.currentState.pushNamed(TennisAiRoutes.signUp);
    }

    if(action is NavigateToEmailSignInAction){
      TennisAiKeys.navKey.currentState.pushNamed(TennisAiRoutes.signIn);
    }

    if(action is NavigateToRegistrationAction){
      TennisAiKeys.navKey.currentState.pushNamed(TennisAiRoutes.registration);
    }
    next(action);
  }
}