import '../utils/optional.dart';
import '../models/models.dart';

List<Tournament> enteredTournamentSelector(AppState state) =>
    state.enteredTournaments;
List<Tournament> watchedTournamentSelector(AppState state) =>
    state.watchedTournaments;

// TournamentsSelector returns the combined Watched and entered tournament
List<Tournament> tournamentsSelector(
    AppState state, TournamentDetailsActionSource source) {
  if (source == TournamentDetailsActionSource.upcoming)
    return state.enteredTournaments;
  if (source == TournamentDetailsActionSource.watching)
    return state.watchedTournaments;
  return [];
}

Optional<Tournament> tournamentSelector(
    List<Tournament> tournaments, String code) {
  try {
    return new Optional.of(tournaments.firstWhere((t) => t.code == code));
  } catch (e) {
    return new Optional.absent();
  }
}

List<Entrant> tournamentEntrantsSelector(
    Tournament tournament, bool sortOrder) {
  var entrants = tournament.entrants;

  entrants.sort((a, b) => sortOrder
      ? b.ranking.compareTo(a.ranking)
      : a.ranking.compareTo(b.ranking));

  return entrants;
}

Optional<Player> playerSelector(AppState state) {
  try {
    return new Optional.of(state.player.first);
  } catch (e) {
    return new Optional.absent();
  }
}

// Search Preference
Optional<SearchPreference> searchPreferenceSelector(AppState state) {
  try {
    return new Optional.of(state.searchPreference.first);
  } catch (e) {
    return new Optional.absent();
  }
}

// Search Result
List<Tournament> searchTournamentsSelector(AppState state) =>
    state.searchTournaments;


//List<Entrant> _getEntrant
AppTab activeTabSelector(AppState state) => state.activeTab;

bool isLoadingSelector(AppState state) => state.isLoading;

bool isEntrantsViewItemsReversedSelector(AppState state) =>
    state.isEntrantsViewItemsReverseSorted;

bool activeEntrantsSortOrderSelector(AppState state) =>
    state.activeEntrantsSortOrder;
