import '../models/models.dart';

List<Tournament> enteredTournamentSelector(AppState state) => state.enteredTournaments;
List<Tournament> watchedTournamentSelector(AppState state) => state.watchedTournaments;

AppTab activeTabSelector(AppState state) => state.activeTab;

bool isLoadingSelector(AppState state) => state.isLoading;