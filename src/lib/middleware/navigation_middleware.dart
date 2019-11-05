import 'package:redux/redux.dart';
import 'package:tennisai/keys/keys.dart';
import '../models/models.dart';
import '../actions/actions.dart';
import '../routes.dart';

class NavigationMiddleware extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if(action is NavigateToEmailSignUpAction){
      TennisAiKeys.navKey.currentState.pushNamed(TennisAiRoutes.signUp);
    }
    next(action);
  }
}