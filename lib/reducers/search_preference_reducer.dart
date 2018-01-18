import 'package:redux/redux.dart';
import '../models/models.dart';
import '../actions/actions.dart';

final searchPreferenceReducer = combineTypedReducers<List<SearchPreference>>([
  new ReducerBinding<List<SearchPreference>, SearchPreferenceLoadedAction>(_setLoadedSearchPreference),
  new ReducerBinding<List<SearchPreference>, SearchPreferenceNotLoadedAction>(_setNoSearchPreference),
  new ReducerBinding<List<SearchPreference>, UpdatePlayerProfileAndSearchPreferenceAction>(_updateSearchPreference),
]);

List<SearchPreference> _setLoadedSearchPreference(List<SearchPreference> searchPref, SearchPreferenceLoadedAction action) {
  return action.searchPreference;
}

List<SearchPreference> _setNoSearchPreference(List<SearchPreference> searchPref, SearchPreferenceNotLoadedAction action) {
  return null;
}

List<SearchPreference> _updateSearchPreference(List<SearchPreference> searchPrefs, UpdatePlayerProfileAndSearchPreferenceAction action){
  return new List<SearchPreference>()..add(action.searchPreference);
}
