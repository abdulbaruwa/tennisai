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

final isSignInUserRegisteredReducer = combineReducers<PlayerRegistrationStatus>([
  new TypedReducer<PlayerRegistrationStatus, SignInUserIsRegisteredAction>(_signInUserIsRegistered),
  new TypedReducer<PlayerRegistrationStatus, SignInUserNotRegisteredAction>(_signInUserNotIsRegistered),
  new TypedReducer<PlayerRegistrationStatus, RegistrationCancelledAction>(_registrationCancelled)
]);

PlayerRegistrationStatus _signInUserIsRegistered(PlayerRegistrationStatus status, SignInUserIsRegisteredAction action) {
  return PlayerRegistrationStatus.registered; 
}
PlayerRegistrationStatus _signInUserNotIsRegistered(PlayerRegistrationStatus status, SignInUserNotRegisteredAction action) {
  return PlayerRegistrationStatus.unregistered; 
}

PlayerRegistrationStatus _registrationCancelled(PlayerRegistrationStatus status, RegistrationCancelledAction action){
  return PlayerRegistrationStatus.unknown;
}

final registerReducer = combineReducers<List<RegistrationInfo>>([
  new TypedReducer<List<RegistrationInfo>, RegistrationSaveAction>(_saveRegistrationInfo),
]);

List<RegistrationInfo> _saveRegistrationInfo(List<RegistrationInfo> registrationInfo, RegistrationSaveAction action){
  return new List<RegistrationInfo>()..add(action.registrationInfo);
}