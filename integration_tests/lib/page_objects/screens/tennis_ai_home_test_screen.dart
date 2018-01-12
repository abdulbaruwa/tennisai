import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';
import '../utils.dart';
import 'test_screen.dart';

class TennisAiHomeTestScreen extends TestScreen{
 TennisAiHomeTestScreen(FlutterDriver driver) : super(driver);

   @override
  Future<bool> isReady({Duration timeout}) => 
      new Future.value(true); // TODO: change this to dashboard lists.
      //new WatchedEnteredListElement(driver).isReady;
}
