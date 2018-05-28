import 'dart:async';
import 'package:flutter_driver/flutter_driver.dart';
import 'test_element.dart';

class UpcomingTabElement extends TestElement {
  final _activeItemsFinder = find.byValueKey('__statsActiveItems__');
  final _completedItemsFinder = find.byValueKey('__statsCompletedItems__');

  UpcomingTabElement(FlutterDriver driver) : super(driver);

  Future<int> get numActive async =>
      int.parse((await driver.getText(_activeItemsFinder)));

  Future<int> get numCompleted async =>
      int.parse((await driver.getText(_completedItemsFinder)));
}
