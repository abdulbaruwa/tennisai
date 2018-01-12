library integration_tests;

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'page_objects/page_objects.dart';
//import 'page_objects/screens/details_test_screen.dart';

main() {
  group('Tennis Ai App Test', () {
    FlutterDriver driver;
    //HomeTestScreen homeScreen;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      // homeScreen = new HomeTestScreen(driver);
    });
  });
  }