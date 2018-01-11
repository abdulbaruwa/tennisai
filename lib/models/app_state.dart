import 'package:meta/meta.dart';
import 'models.dart';

@immutable
class AppState {
  final bool isLoading;
  final bool isEntrantsViewItemsReverseSorted;
  final List<Player> player;
  final List<Tournament> tournaments;
  final AppTab activeTab;
  final List<Tournament> enteredTournaments;
  final List<Tournament> watchedTournaments;
  final bool activeEntrantsSortOrder;

  AppState(
      {this.isLoading = false,
      this.player = const [],
      this.enteredTournaments = const [],
      this.watchedTournaments = const [],
      this.tournaments = const [],
      this.activeTab = AppTab.dashboard,
      this.activeEntrantsSortOrder = false});

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith(
      {bool isLoading,
      List<Player> player,
      List<Tournament> tournaments,
      List<Tournament> enteredTournaments,
      List<Tournament> watchedTournaments,
      AppTab activeTab,
      bool isEntrantsViewItemsReverseSorted,
      bool activeEntrantsSortOrder}) {
    return new AppState(
        isLoading: isLoading ?? this.isLoading,
        activeEntrantsSortOrder:
            activeEntrantsSortOrder ?? activeEntrantsSortOrder,
        player: player ?? this.player,
        tournaments: tournaments ?? this.tournaments,
        watchedTournaments: watchedTournaments ?? this.watchedTournaments,
        enteredTournaments: enteredTournaments ?? this.enteredTournaments,
        activeTab: activeTab ?? this.activeTab);
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      player.hashCode ^
      activeTab.hashCode ^
      tournaments.hashCode ^
      enteredTournaments.hashCode ^
      watchedTournaments.hashCode ^
      activeEntrantsSortOrder.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          isEntrantsViewItemsReverseSorted ==
              other.isEntrantsViewItemsReverseSorted &&
          activeEntrantsSortOrder == other.activeEntrantsSortOrder &&
          player == other.player &&
          tournaments == other.tournaments &&
          watchedTournaments == other.watchedTournaments &&
          enteredTournaments == other.enteredTournaments &&
          activeTab == other.activeTab;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, player: $player, tournaments: $tournaments, watchedTournaments: $watchedTournaments, enteredTournaments: $enteredTournaments, activeTab: $activeTab, isEntrantsViewItemsReverseSorted: $isEntrantsViewItemsReverseSorted, activeEntrantsSortOrder: $activeEntrantsSortOrder}';
  }
}
