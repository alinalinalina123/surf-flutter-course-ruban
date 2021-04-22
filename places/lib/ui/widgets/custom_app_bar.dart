import 'package:flutter/material.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/search_sight_screen.dart';
import 'package:places/ui/widgets/search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  late final String title;
  late final AppBarType type;
  late final IconData? backButtonIcon;
  late final String? backButtonTitle;
  late final VoidCallback onClear;
  late final VoidCallback onSkip;
  late final Function(String) onQueryChanged;
  late final Function(List<Sight>) onFilterApplied;
  late final TabBar? tabBar;

  CustomAppBar({
    Key? key,
    required String title,
    AppBarType? type,
    IconData? backButtonIcon,
    String? backButtonTitle,
    VoidCallback? onClear,
    VoidCallback? onSkip,
    Function(String)? onQueryChanged,
    Function(List<Sight>)? onFilterApplied,
    TabBar? tabBar,
  }) : super(key: key) {
    this.title = title;
    this.type = type ?? AppBarType.simple;
    this.backButtonTitle = backButtonTitle;
    this.backButtonIcon = backButtonIcon;
    this.onFilterApplied = onFilterApplied ?? (List<Sight> list){};
    this.onQueryChanged = onQueryChanged ?? (String query){};
    this.onSkip = onSkip ?? (){};
    this.onClear = onClear ?? (){};
    this.tabBar = tabBar;
  }

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
    }
  }

  Widget? _leadingWidget(BuildContext context) {
    if (backButtonIcon != null)
      return IconButton(
        icon: Icon(backButtonIcon),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    if (backButtonTitle != null)
      return FlatButton(
        child: Text(backButtonTitle ?? ""),
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
