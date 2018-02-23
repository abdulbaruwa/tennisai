import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../keys/keys.dart';

enum AppTab{home, upcoming, search, basket, profile}
class TabItem {
  const TabItem({this.title, this.icon, this.key});
  final String title;
  final IconData icon;
  final Key key;
}

 const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Home', icon: Icons.home, key: TennisAiKeys.homeTab),
  const TabItem(title: 'Upcoming', icon: Icons.watch_later, key: TennisAiKeys.dashBoardTab),
  const TabItem(title: 'Search', icon: Icons.search, key: TennisAiKeys.searchTab),
  const TabItem(title: 'Basket', icon: Icons.shopping_basket, key: TennisAiKeys.basketTab),
  const TabItem(title: 'Settings', icon: Icons.settings, key: TennisAiKeys.settingsTab),
];
