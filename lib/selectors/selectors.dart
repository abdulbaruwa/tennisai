import '../utils/optional.dart';
import '../models/models.dart';

List<Tournament> enteredTournamentSelector(AppState state) => state.enteredTournaments;
List<Tournament> watchedTournamentSelector(AppState state) => state.watchedTournaments;

// TournamentsSelector returns the combined Watched and entered tournament
List<Tournament> tournamentsSelector(AppState state, TournamentDetailsActionSource source) {
  if(source == TournamentDetailsActionSource.entered) return state.enteredTournaments;
  if(source == TournamentDetailsActionSource.watched) return state.watchedTournaments;
  return [];
}

Optional<Tournament> tournamentSelector(List<Tournament> tournaments, String code) {
  try {
    return new Optional.of(tournaments.firstWhere((t) => t.code == code));
  } catch (e) {
    return new Optional.absent();
  }
}

AppTab activeTabSelector(AppState state) => state.activeTab;

bool isLoadingSelector(AppState state) => state.isLoading;