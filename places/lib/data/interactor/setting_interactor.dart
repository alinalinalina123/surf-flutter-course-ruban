
import 'package:flutter/material.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/utils/theme_notifier.dart';
import 'package:provider/provider.dart';

final settingsInteractor = SettingsInteractor();

///Interactor for search places
class SettingsInteractor {

  SettingsInteractor();

  void changeTheme(BuildContext context, bool isDark) {
    var themeNotifier = Provider.of<ThemeNotifier>(context);
    isDark
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
  }

  bool getTheme(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return (themeNotifier.getTheme() == darkTheme);
  }

}
