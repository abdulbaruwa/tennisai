import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import '../utils.dart';
import 'test_screen.dart';
import '../elements/watched_tournaments_list_element.dart';

class HomeScreenTest extends TestScreen {
  HomeScreenTest(FlutterDriver driver) : super(driver);

  final _dashboardTabFinder = find.byValueKey('__dashboardTab__');
  final _searchTabFinder = find.byValueKey('__searchTab__');
  final _basketTabFinder = find.byValueKey('__basketTab__');
  final _settingsTabFinder = find.byValueKey('__settingsTab__');

  @override
  Future<bool> isReady({Duration timeout}) => new DashboardElement(driver).isReady;

 

  DashboardElement get dashboard {
    return new DashboardElement(driver);
  }

}
