import '../models/models.dart';

class LoadPlayerAction {}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);
}

class PlayerNotLoadedAction {}

class PlayerLoadedAction {
  final List<Player> player;

  PlayerLoadedAction(this.player);
}

class WatchedTournamentsNotLoadedAction {}


class WatchedTournamentsLoadedAction {
  final List<Tournament> watchedTournaments;

  WatchedTournamentsLoadedAction(this.watchedTournaments);
}

class LoadWatchedTournamentsAction {}

class AddWatchedTournamentsAction {
  final Tournament tournament;
  AddWatchedTournamentsAction(this.tournament);
}
