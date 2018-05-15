import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';

final authReducer = combineReducers<List<Settings>>([
  new TypedReducer<List<Settings>, SignInCompletedAction>(
      _signInWithGoogleAction),
]);

List<Settings> _signInWithGoogleAction(List<Settings> settings, SignInCompletedAction action) {
  return new List<Settings>()..add(action.settings);
}

final authStatusReducer = combineReducers<bool>([
  new TypedReducer<bool, SignInCompletedAction>(
      _signInCompletedUpdateStatus),
]);

bool _signInCompletedUpdateStatus(bool status, SignInCompletedAction action){
  return true;
}
