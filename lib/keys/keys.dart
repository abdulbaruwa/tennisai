import 'package:flutter/widgets.dart';

class TennisAiKeys {
  static final homeScreen = const Key('__homeScreen__');
  static final editProfile = const Key('__editProfile__');
  static final snackbar = const Key('__snackbar__');

  // Tabs
  static final tabs = const Key('__tabs__');
  static const homeTab = const Key('__homeTab__');
  static const dashBoardTab = const Key('__dashboardTab__');
  static const searchTab = const Key('__searchTab__');
  static const basketTab = const Key('__basketTab__');
  static const settingsTab = const Key('__settingsTab__');

  // Dashboard
  static final dashboardList = const Key('__dashboardList__');
  static final watchingSubTab = const Key('__watchingSubTab__');
  static final upcomingSubTab = const Key('__upcomingSubTab__');

  static final tournamentItemName = (String id, String source) =>
      new Key('TournamentItemName__${id}__${source}');
  static final tournamentItem =
      (String id, String source) => new Key('TournamentItem__${id}__${source}');
  static final todoItemNote = (String id) => new Key('TodoItem__${id}__Note');

  // Profile
  static final profileName = const Key('__profileName__');
  static final profileLtaNumber = const Key('__profileLtaNumber__');
  static final profileLtaRating = const Key('__profileLtaRating__');
  static final profileLtaRanking = const Key('__profileLtaRanking__');


  static final basket = const Key('__profileName__');
}
