import 'package:flutter/material.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/screen/search_sight_screen.dart';
import 'package:places/ui/widgets/search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBarType type;
  final IconData backButtonIcon;
  final String backButtonTitle;
  final VoidCallback onClear;
  final VoidCallback onSkip;
  final Function(String) onQueryChanged;
  final Function(List<Sight>) onFilterApplied;
  final TabBar tabBar;

  const CustomAppBar(
      {Key key,
      @required this.title,
      @required this.type,
      this.backButtonIcon,
      this.backButtonTitle,
      this.onClear,
      this.tabBar,
      this.onSkip,
      this.onQueryChanged,
      this.onFilterApplied})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    switch (type) {
      case AppBarType.simple:
        return SizedBox(
          height: statusBarHeight + 80,
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                ),
              ],
            ),
            leadingWidth: 85.0,
            leading: _leadingWidget(context),
            bottom: tabBar,
          ),
        );
        break;

      case AppBarType.onBoarding:
        return SizedBox(
          height: statusBarHeight + 80,
          child: AppBar(
            elevation: 0,
            actions: [
              FlatButton(
                child: Text(skipButtonTitle),
                textColor: colorGreen,
                onPressed: () {
                  onSkip();
                },
              ),
            ],
          ),
        );
        break;

      case AppBarType.filter:
        return SizedBox(
          height: statusBarHeight + 80,
          child: AppBar(
            elevation: 0,
            actions: [
              FlatButton(
                child: Text(clearButtonTitle),
                textColor: colorGreen,
                onPressed: () {
                  onClear();
                },
              ),
            ],
          ),
        );
        break;
      default:
        return SizedBox(
          height: preferredSize.height,
          child: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: preferredSize,
              child: CustomSearchBar(
                isForNavigation: type == AppBarType.main,
                onQueryChanged: (String query) {
                  onQueryChanged(query);
                },
                onFilterApplied: (sights) {
                  onFilterApplied(sights);
                },
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SearchSightScreen();
                    }),
                  );
                },
              ),
            ),
          ),
        );
        break;
    }
  }

  Widget _leadingWidget(BuildContext context) {
    if (backButtonIcon != null)
      return IconButton(
        icon: Icon(backButtonIcon),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    if (backButtonTitle != null)
      return FlatButton(
        child: Text(backButtonTitle),
        textColor: Theme.of(context).accentColor,
        onPressed: () {
          Navigator.pop(context);
        },
      );
    return null;
  }

  @override
  Size get preferredSize => const Size.fromHeight(158);
}
