import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBarType type;
  final IconData backButtonIcon;
  final String backButtonTitle;
  final VoidCallback onClear;
  final TabBar tabBar;

  const CustomAppBar({
    Key key,
    @required this.title,
    @required this.type,
    this.backButtonIcon,
    this.backButtonTitle,
    this.onClear,
    this.tabBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    switch (type) {
      case AppBarType.main:
        return SizedBox(
          height: preferredSize.height,
          child: Padding(
            padding: appBarPadding,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              maxLines: 2,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        );
        break;
      case AppBarType.filter:
        return SizedBox(
          height: statusbarHeight + 50,
          child: AppBar(
            elevation: 0,
            title: Center(
              child: Row(
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      arrowIcon,
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text(clearButtonTitle),
                    textColor: colorGreen,
                    onPressed: () {
                      onClear();
                    },
                  ),
                ],
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
        );
        break;
      default:
        return SizedBox(
          height: statusbarHeight + 70,
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
