import 'package:flutter_driver/flutter_driver.dart';

import 'page_objects/page_objects.dart';
import 'page_objects/screens/home_screen_test.dart';

main() {
  group('Tennis Ai App Test', () {
    FlutterDriver driver;
    HomeScreenTest homeScreen;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
      homeScreen = new HomeScreenTest(driver);
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

      test('should start with a list of Tournaments', () async {
      expect(await homeScreen.isReady(), isTrue);
      expect(await homeScreen.dashboard.tournamentItem('1', 'upcoming').isVisible, isTrue);
      expect(await homeScreen.dashboard.tournamentItem('2', 'upcoming').isVisible, isTrue);
    });

  });
}
