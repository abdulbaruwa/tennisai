import 'dart:async';
import 'package:flutter_driver/flutter_driver.dart';
import '../utils.dart';
import 'test_element.dart';

class TournamentItemElement extends TestElement {
  final String id;
  final String source;

  TournamentItemElement(this.id, this.source, FlutterDriver driver) : super(driver);

  SerializableFinder get _tournamentFinder => find.byValueKey('TournamentItem__${id}__$source');

  Future<bool> get isVisible => widgetExists(driver, _tournamentFinder);

  Future<bool> get isAbsent => widgetAbsent(driver, _tournamentFinder);

  Future<String> get task async => await driver.getText(_tournamentFinder);

  Future<String> get name async => await driver.getText(find.byValueKey('TournamentItemName__${id}__$source'));

  // Future<TodoItemElement> tapCheckbox() async {
  //   await driver.tap(_checkboxFinder);
  //   await driver.waitUntilNoTransientCallbacks();

  //   return this;
  // }

  // DetailsTestScreen tap() {
  //   driver.tap(_tournamentFinder);

  //   return new DetailsTestScreen(driver);
  // }
}
