import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/utils/theme_notifier.dart';
import 'package:provider/provider.dart';

//Widget for Settings page
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _darkTheme = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            settingsTitle,
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _darkThemeSwitcherWidget(),
            _tutorialWatchWidget(),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  Widget _darkThemeSwitcherWidget() {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return Row(
      children: [
        Text(
          darkThemeTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        Switch.adaptive(
          value: _darkTheme,
          activeColor: colorGreen,
          onChanged: (isDark) {
            setState(() {
              _darkTheme = isDark;
            });
            onThemeChanged(isDark, themeNotifier);
          },
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _tutorialWatchWidget() {
    return Row(
      children: [
        Text(
          watchTutorialTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        IconButton(
          icon: SvgPicture.asset(infoIcon),
          onPressed: () {},
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    value ? themeNotifier.setTheme(darkTheme) : themeNotifier.setTheme(lightTheme);
  }
}
