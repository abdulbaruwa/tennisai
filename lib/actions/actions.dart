import '../models/models.dart';

class LoadPlayerAction{}

class UpdateTabAction {
  final AppTab newTab;

  UpdateTabAction(this.newTab);
}

class PlayerNotLoadedAction {}

class PlayerLoadedAction {
  final List<Player> player;

  PlayerLoadedAction(this.player);
}
