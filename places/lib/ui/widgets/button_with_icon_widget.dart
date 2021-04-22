import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

//Widget for displaying custom app buttons with icons.
class ButtonWithIconWidget extends StatelessWidget {
  final String title;
  final String iconName;
  final VoidCallback onPressed;

  const ButtonWithIconWidget({
    Key? key,
    required this.title,
    required this.iconName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      textColor: Theme.of(context).accentColor,
      disabledTextColor: colorGrey,
      icon: SvgPicture.asset(
        iconName,
        color: Theme.of(context).accentColor,
      ),
      label: Text(title),
      onPressed: () {
        onPressed();
      },
    );
  }
}
