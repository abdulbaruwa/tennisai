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
  new TypedReducer<bool, SignInCompletedAction>(_signInCompletedUpdateStatus),
  new TypedReducer<bool, GoogleSilentSignInFailedAction>(_googleSilentSignInFailed)
]);

bool _signInCompletedUpdateStatus(bool status, SignInCompletedAction action){
  return true;
}

bool _googleSilentSignInFailed(bool status, GoogleSilentSignInFailedAction action){
  return false;
}

final isSignInUserRegisteredReducer = combineReducers<bool>([
  new TypedReducer<bool, SignInUserIsRegisteredAction>(_signInUserIsRegistered),
  new TypedReducer<bool, SignInUserNotRegisteredAction>(_signInUserNotIsRegistered),
  new TypedReducer<bool, RegistrationCancelledAction>(_registrationCancelled)
]);

bool _signInUserIsRegistered(bool status, SignInUserIsRegisteredAction action) {
  return true; 
}
bool _signInUserNotIsRegistered(bool status, SignInUserNotRegisteredAction action) {
  return false; 
}

bool _registrationCancelled(bool status, RegistrationCancelledAction action){
  return true;
}