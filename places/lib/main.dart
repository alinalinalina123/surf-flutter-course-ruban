import 'package:flutter/material.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/category_selection_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/on_boarding_screen.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/search_sight_screen.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/splash_screen.dart';
import 'package:places/ui/screen/tabs_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';
import 'package:places/utils/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(lightTheme),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Places app',
      home: SplashScreen(),
      theme: themeNotifier.getTheme(),
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
        TabsScreen.routeName: (context) => TabsScreen(),
        SightListScreen.routeName: (context) => SightListScreen(),
        VisitingScreen.routeName: (context) => VisitingScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(),
        SearchSightScreen.routeName: (context) => SearchSightScreen(),
        SightDetails.routeName: (context) => SightDetails(),
        AddSightScreen.routeName: (context) => AddSightScreen(),
        FiltersScreen.routeName: (context) => FiltersScreen(),
        CategorySelectionScreen.routeName: (context) => CategorySelectionScreen(),
      },
    );
  }
}
