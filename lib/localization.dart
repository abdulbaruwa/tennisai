import 'dart:async';

import 'package:flutter/material.dart';

class TennisAiLocalizations {
  static TennisAiLocalizations of(BuildContext context) {
    return Localizations.of<TennisAiLocalizations>(
      context,
      TennisAiLocalizations,
    );
  }

  String get appTitle => "Tennis Ai";
}

class ReduxLocalizationsDelegate
    extends LocalizationsDelegate<TennisAiLocalizations> {
  @override
  Future<TennisAiLocalizations> load(Locale locale) =>
      new Future(() => new TennisAiLocalizations());

  @override
  bool shouldReload(ReduxLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");
}
