import 'package:meta/meta.dart';
import 'models.dart';

@immutable
class AppState {
  final bool isLoading;
  final bool isEntrantsViewItemsReverseSorted;
  final List<Player> player;
  final List<SearchPreference> searchPreference;
  final List<Tournament> tournaments;
  final AppTab activeTab;
  final List<Tournament> enteredTournaments;
  final List<Tournament> watchedTournaments;
  final List<Tournament> searchTournaments;
  final bool activeEntrantsSortOrder;

  AppState(
      {this.isLoading = false,
      this.player = const [],
      this.searchPreference = const [],
      this.enteredTournaments = const [],
      this.watchedTournaments = const [],
      this.searchTournaments = const [],
      this.tournaments = const [],
      this.activeTab = AppTab.dashboard,
      this.activeEntrantsSortOrder = false});

  factory AppState.loading() => new AppState(isLoading: true);

  AppState copyWith(
      {bool isLoading,
      List<Player> player,
      List<SearchQueryPreference> searchQueryPreference,
      List<Tournament> tournaments,
      List<Tournament> enteredTournaments,
      List<Tournament> watchedTournaments,
      List<Tournament> searchTournaments,
      AppTab activeTab,
      bool isEntrantsViewItemsReverseSorted,
      bool activeEntrantsSortOrder}) {
    return new AppState(
        isLoading: isLoading ?? this.isLoading,
        activeEntrantsSortOrder:
            activeEntrantsSortOrder ?? activeEntrantsSortOrder,
        player: player ?? this.player,
        searchPreference: searchQueryPreference ?? this.searchPreference,
        tournaments: tournaments ?? this.tournaments,
        searchTournaments: searchTournaments ?? this.searchTournaments,
        watchedTournaments: watchedTournaments ?? this.watchedTournaments,
        enteredTournaments: enteredTournaments ?? this.enteredTournaments,
        activeTab: activeTab ?? this.activeTab);
  }

  @override
  int get hashCode =>
      isLoading.hashCode ^
      player.hashCode ^
      searchPreference.hashCode ^
      activeTab.hashCode ^
      tournaments.hashCode ^
      searchTournaments.hashCode ^
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
          searchPreference == other.searchPreference &&
          tournaments == other.tournaments &&
          searchTournaments == other.searchTournaments &&
          watchedTournaments == other.watchedTournaments &&
          enteredTournaments == other.enteredTournaments &&
          activeTab == other.activeTab;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, player: $player, searchQueryPreference: $searchPreference, tournaments: $tournaments, searchTournaments: $searchTournaments, watchedTournaments: $watchedTournaments, enteredTournaments: $enteredTournaments, activeTab: $activeTab, isEntrantsViewItemsReverseSorted: $isEntrantsViewItemsReverseSorted, activeEntrantsSortOrder: $activeEntrantsSortOrder}';
  }
}
