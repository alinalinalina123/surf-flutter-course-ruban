import 'package:flutter/material.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

//Defines navigation items for BottomNavigation
class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem(
    this.page,
    this.title,
    this.icon,
  );

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
       SightListScreen(),
       Text(""),
       Icon(Icons.list_alt),
    ),
    TabNavigationItem(
       Scaffold(),
       Text(""),
       Icon(Icons.map_outlined),
    ),
    TabNavigationItem(
       VisitingScreen(),
       Text(""),
       Icon(Icons.favorite_outline_rounded),
    ),
    TabNavigationItem(
       SettingsScreen(),
       Text(""),
       Icon(Icons.settings),
    ),
  ];
}