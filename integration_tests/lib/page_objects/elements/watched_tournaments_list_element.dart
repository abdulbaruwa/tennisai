import 'dart:async';
import 'package:flutter_driver/flutter_driver.dart';
import '../utils.dart';
import 'test_element.dart';
import 'tournament_item_element.dart';

class DashboardElement extends TestElement {
  final _dashboardListFinder = find.byValueKey('__dashboardList__');
  final _upcomingSubTabFinder = find.byValueKey('__upcomingSubTab__');
  final _watchingSubTabFinder = find.byValueKey('__watchingSubTab__');
  //final _loadingFinder = find.byValueKey('__todosLoading__');

  DashboardElement(FlutterDriver driver) : super(driver);

  // Future<bool> get isLoading {
  //   // We need to run this command "unsynchronized". This means it immediately
  //   // checks if the loading widget is on screen, rather than waiting for any
  //   // pending animations to complete.
  //   //
  //   // Since the CircularProgressIndicator runs a continuous animation, if we
  //   // do not `runUnsynchronized`, this check will never work.
  //   return driver.runUnsynchronized(() {
  //     return widgetExists(driver, _loadingFinder);
  //   });
  // }

  Future<bool> get isReady => widgetExists(driver, _upcomingSubTabFinder);

  TournamentItemElement tournamentItem(String id, String source) => new TournamentItemElement(id, source, driver);

  // TodoItemElement todoItemAbsent(String id) => new TodoItemElement(id, driver);
}
