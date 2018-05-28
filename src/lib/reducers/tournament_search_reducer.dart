import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/models.dart';

final tournamentSearchReducer = combineReducers<List<Tournament>>([
  new TypedReducer<List<Tournament>, SearchTournamentsLoadedAction>(_setLoadedSearchTournaments),
  new TypedReducer<List<Tournament>, SearchTournamentsNotLoadedAction>(_setNoSearchTournaments),
]);

List<Tournament> _setLoadedSearchTournaments(List<Tournament> watchedTournaments, SearchTournamentsLoadedAction action ){return action.searchTournaments;}
List<Tournament> _setNoSearchTournaments(List<Tournament> watchedTournaments, SearchTournamentsNotLoadedAction action){return [];}


// List<Tournament> _searchTournamentsWithPreference(List<Tournament> tournaments, SearchTournamentWithPreferenceAction action){return action.searchPreference;}
