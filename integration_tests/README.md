# TennisAi Integration tests


## Key Concepts

  * `flutter_driver` is used to drive the tests.
  * The tests are structured using the Page Object Model

  ## Drive tests with `flutter_driver`

In order to run tests on against your app, you need to use the `flutter_driver`. This tool allows you to find Widgets on screen and send commands to them. This allows you to tap on Widgets, scroll through lists, or get the text of a Text Widget.

To get started with Flutter Driver, please check out the following links:

  * [How to write an integration test in Flutter](http://cogitas.net/write-integration-test-flutter/) by [Natalie Masse Hooper](https://twitter.com/NatJM)    
  * Visit the [Flutter Testing](https://flutter.io/testing/#integration-testing) page.

## Organize Code with the Page Object Model

In order to make tests more readable and maintainable, this test suite demonstrates how to structure tests using the Page Object Model (POM) pattern. What is the Page Object Model? It's best to demonstrate through code.

Let's take a pretty standard test and refactor it using the POM pattern. This is a simplified example, for a more complete example please view the files in the `lib` folder.
  