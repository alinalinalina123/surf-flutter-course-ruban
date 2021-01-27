import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

//Widget for displaying custom app buttons with icons.
class ButtonWithIconWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  const ButtonWithIconWidget({Key key, @required this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: smallPadding,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).accentColor,
          ),
          Text(
            title,
            style: TextStyle(color: Theme.of(context).accentColor),
          )
        ],
      ),
    );
  }
}
