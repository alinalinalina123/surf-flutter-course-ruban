import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/text_styles.dart';

/// Widget to display button with customized title and background color
class CustomButtonWidget extends StatelessWidget {
  final String title;
  final String iconName;
  final bool isEnabled;
  final VoidCallback onPressed;

  const CustomButtonWidget({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.iconName,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (iconName != null) {
      return SizedBox(
        width: double.infinity,
        height: 70.0,
        child: Padding(
          padding: titleWidgetPadding,
          child: RaisedButton.icon(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            icon: SvgPicture.asset(iconName),
            label: Text(
              title,
              style: whiteTitleStyle,
            ),
            disabledColor: colorGrey,
            color: colorGreen,
            textColor: Theme.of(context).primaryColor,
            onPressed: isEnabled ? () {
              onPressed();
            } : null,
          ),
        ),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        height: 70.0,
        child: Padding(
          padding: titleWidgetPadding,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              title,
              style: whiteTitleStyle,
            ),
            disabledColor: colorGrey,
            color: colorGreen,
            textColor: Theme.of(context).primaryColor,
            onPressed: isEnabled ? () {
              onPressed();
            } : null,
          ),
        ),
      );
    }
  }
}
