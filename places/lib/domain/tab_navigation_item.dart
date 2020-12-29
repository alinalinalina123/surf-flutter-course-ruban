import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: SightListScreen(),
      icon: Icon(Icons.list_alt),
      title: Text(""),
    ),
    TabNavigationItem(
      page: Scaffold(),
      icon: Icon(Icons.map_outlined),
      title: Text(""),
    ),
    TabNavigationItem(
      page: VisitingScreen(),
      icon: Icon(Icons.favorite_outline_rounded),
      title: Text(""),
    ),
    TabNavigationItem(
      page: Scaffold(),
      icon: Icon(Icons.settings),
      title: Text(""),
    ),
  ];
}