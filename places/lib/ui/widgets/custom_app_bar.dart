import 'package:flutter/material.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';
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

      case AppBarType.search:
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
                  Navigator.pushNamed(
                    context,
                    SearchSightScreen.routeName,
                  );
                },
              ),
            ),
          ),
        );
      case AppBarType.main:
        return SliverAppBar(
          expandedHeight: preferredSize.height,
          floating: false,
          elevation: 0,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Padding(
              padding: smallWidgetPadding,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline2,
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
