import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: preferredSize.height,
      child: Padding(
        padding: appBarPadding,
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          maxLines: 2,
          style: appBarStyle,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(158);
}