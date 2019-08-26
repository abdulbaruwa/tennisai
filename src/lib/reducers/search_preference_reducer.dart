import 'package:redux/redux.dart';
import 'package:swagger/api.dart';
import '../actions/actions.dart';

final searchPreferenceReducer = combineReducers<List<SearchPreference>>([
  new TypedReducer<List<SearchPreference>, SearchPreferenceLoadedAction>(_setLoadedSearchPreference),
  new TypedReducer<List<SearchPreference>, SearchPreferenceNotLoadedAction>(_setNoSearchPreference),
  new TypedReducer<List<SearchPreference>, UpdatePlayerProfileAndSearchPreferenceAction>(_updateSearchPreference),
  new TypedReducer<List<SearchPreference>, SearchTournamentWithPreferenceAction>(_setActiveSearchPreference),
]);

List<SearchPreference> _setLoadedSearchPreference(List<SearchPreference> searchPref, SearchPreferenceLoadedAction action) {
  return action.searchPreference;
}

List<SearchPreference> _setActiveSearchPreference(List<SearchPreference> searchPref, SearchTournamentWithPreferenceAction action) {
  return new List<SearchPreference>()..add(action.searchPreference);
}

List<SearchPreference> _setNoSearchPreference(List<SearchPreference> searchPref, SearchPreferenceNotLoadedAction action) {
  return null;
}

List<SearchPreference> _updateSearchPreference(List<SearchPreference> searchPrefs, UpdatePlayerProfileAndSearchPreferenceAction action){
  return new List<SearchPreference>()..add(action.searchPreference);
}
